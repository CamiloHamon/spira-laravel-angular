import { Component, OnInit } from '@angular/core';
import { AuthService } from "../../services/auth.service";
import { Router } from '@angular/router'
import { CursosService } from '../../services/cursos.service'

@Component({
  selector: 'app-cursos',
  templateUrl: './cursos.component.html',
  styleUrls: ['./cursos.component.css']
})
export class CursosComponent implements OnInit {
  cursos: any = []
  constructor(private authServive: AuthService, private router: Router, private cursosService: CursosService) { }

  ngOnInit(): void {
    const val = this.authServive.isAdmin()
    if (val) this.router.navigate(['/administrador']);

    this.cursosService.getUsers()
      .subscribe(
        res => {
          const modify = this.getRowNumber(res);
          this.cursos = modify;
        },
        err => console.log(err)
      )
  }

  getRowNumber(res:any) {
    let no = 1;
    
    for (const r of res) {
      r.no = no;
      no++;
    }
    return res;
  }



}
