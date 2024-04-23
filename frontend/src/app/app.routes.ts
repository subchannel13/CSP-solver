import { Routes } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { WelcomeComponent } from './welcome/welcome.component';

export const routes: Routes = [
    { path: 'welcome', component: WelcomeComponent },
    { path: 'dashboard', component: DashboardComponent },
    { path: '**', component: WelcomeComponent },
];
