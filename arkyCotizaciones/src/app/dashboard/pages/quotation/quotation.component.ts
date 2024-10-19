import { CommonModule } from '@angular/common';
import { ChangeDetectorRef, Component, NgZone, OnInit, Renderer2 } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { QuotationInterface } from '../../../interfaces/quotation.interface';
import { QuotationService } from '../../../services/quotation.service';
import { StateInterface } from '../../../interfaces/state.interface';
import { StateService } from '../../../services/state.service';
import { UpdateState } from '../../../interfaces/updateState.interface';
import { QuotationFindInterface } from '../../../interfaces/quotationFind.interface';
import { NgxPaginationModule } from 'ngx-pagination';
import * as html2pdf from 'html2pdf.js';


@Component({
  selector: 'app-quotation',
  standalone: true,
  imports: [RouterLink, FormsModule, CommonModule, NgxPaginationModule],
  templateUrl: './quotation.component.html',
  styleUrl: './quotation.component.scss'
})
export default class QuotationComponent implements OnInit{


  quotations: QuotationInterface[]=[];
  page: number = 1; 
  itemsPerPage: number = 10; 
  quotationToDelete: number | null = null;

  

  selectedQuotation?: QuotationFindInterface | null = null;

  states: StateInterface[]=[      
    { stateId: 1, name: 'Pendiente' },
    { stateId: 2, name: 'Aceptada' },
    { stateId: 3, name: 'Rechazada' }];

  selectedOption: string = ''; 

  loading: boolean = false;
  loadingPdf: boolean = false;
  constructor(private quotationService: QuotationService, private stateService: StateService, private cdr: ChangeDetectorRef){}

  ngOnInit(): void {
    this.getQuotations();
    this.getStates(); 

  }



  getQuotations(): void {
    this.loading = true;
    this.quotationService.getAllQuotations().subscribe({
      next: (result) => {
        console.log('Quotations cargadas:', result); // Verifica los datos aquí
        this.quotations = result;
        this.loading = false;
      },
      error: (err) => {
        console.log(err);
        this.loading = false;
      }
    });
  }


  // Método para obtener una cotización completa por su ID (detalle)
  getQuotationById(id: number): void {
    console.log('ID de la cotización seleccionada:', id);
    this.quotationService.getQuotationById(id).subscribe({
      next: (data) => {
        this.selectedQuotation = data;
        console.log('Cotización obtenida:', this.selectedQuotation);
        this.cdr.detectChanges();
      },
      error: (error) => {
        console.error('Error al obtener la cotización', error);
      }
    });
  }
  

  getStates(): void {
    this.stateService.getAllStates().subscribe({
      next: (result) => {
        console.log('States cargados:', result); // Verifica los datos aquí
        this.states = result;
      },
      error: (err) => {
        console.log(err);
      }
    });
  }


  updateQuotationState(quotation: QuotationInterface, stateId: number, element: HTMLSelectElement): void {
    const updateState: UpdateState = { stateId };

    this.quotationService.updateQuotationState(quotation.quotationId, updateState).subscribe({
      next: (updatedQuotation) => {
        console.log('Cotización actualizada:', updatedQuotation);
        // Actualizar el estado en la lista local

        quotation.state = this.states.find(state => state.stateId === stateId)!;

        this.getQuotations();

      },
      error: (error) => {
        console.error('Error al actualizar la cotización:', error);
      },
      complete: () => {
        console.log('Actualización de estado completada');
      }
    });
  }



  openDeleteModal(id: number): void {
    this.quotationToDelete = id;
  }

  deleteQuotation(): void {
    if (this.quotationToDelete !== null) {
      this.quotationService.deleteQuotation(this.quotationToDelete).subscribe({
        next: () => {
          console.log('Cliente eliminado con éxito');
          this.getQuotations(); 
          this.quotationToDelete = null; // Limpiar el cliente a eliminar después de eliminarlo
        },
        error: (error) => {
          console.error('Error al eliminar el cliente', error);
        }
      });
    }
  }


  getAndDownloadPDF(id: number): void {
    this.loadingPdf= true;
    console.log('Iniciando la descarga de la cotización...');
    const startTime = Date.now(); // Marca el inicio del tiempo
  
    this.quotationService.getQuotationById(id).subscribe({
      next: (data) => {
        const endTime = Date.now(); // Marca el final del tiempo
        console.log(`Tiempo de respuesta del servidor: ${endTime - startTime}ms`);
  
        this.selectedQuotation = data;
        console.log('Cotización obtenida:', this.selectedQuotation);
  
        // Asegurarse de que la vista esté actualizada antes de descargar el PDF
        this.cdr.detectChanges();
  
        // Una vez cargados los datos, genera y descarga el PDF
        this.downloadPDF();
        this.loadingPdf= false;
       
      },
      error: (error) => {
        console.error('Error al obtener la cotización:', error);
      }
    });
  }
  
  


  async downloadPDF() {

    const spinner = document.getElementById('loading-spinner');
    spinner.style.display = 'block'; // Mostrar spinner

    const element = document.getElementById('template-pdf');
    
    if (element) {
      const options = {
        margin: 0,
        filename: 'cotizacion.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 1, logging: true, useCORS: true }, // Prueba con scale: 1
        jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
      };
      
      try {
        // Asegúrate de que la vista esté completamente actualizada antes de la descarga
        this.cdr.detectChanges();
  
        // Espera a que se complete la generación del PDF
        await html2pdf().from(element).set(options).save();
  
        console.log("PDF generado exitosamente");
      } catch (error) {
        console.error("Error al generar el PDF:", error);
      }
    } else {
      console.error('El contenido del PDF no se encuentra.');
    }
  }
  












}