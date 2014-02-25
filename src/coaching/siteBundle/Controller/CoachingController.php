<?php

namespace coaching\siteBundle\Controller;

use coaching\siteBundle\Entity\Sportif;
use coaching\siteBundle\Entity\User;
use coaching\siteBundle\Entity\Coach; 

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class CoachingController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('coachingBundle:coaching:index.html.twig', array('name' => $name));
    }
    public function accueilAction()
    {
        return $this->render('coachingBundle:coaching:accueil.html.twig');
    }
    public function sportifAction()
    {
    	
    	$doctrine=$this->getDoctrine();
    	
    	$manager=$doctrine->getManager();
    
    	$repository=$manager->getRepository("coachingBundle:User");
    	
    	$user=$repository->find('2');
    	
    	
    	$sportif=new Sportif();
    	
    	$formBuilder = $this->createFormBuilder($sportif);
    	
    	$formBuilder
    		->add('taille','integer')
    		->add('poids','number')
    		->add('sexe','choice', array('choices' =>array('0'=>'Masculin','1'=>'Féminin'),'expanded' => 'true','data' => 0))
    		->add('date_naissance','date')
    		->add('niveau','text');

    	$form = $formBuilder->getForm();

    	$request = $this->get('request');

    	if ($request->getMethod() == 'POST')
         {
            $form->bind($request); 

            if ($form->isValid())
            {
            	$sportif->setUser($user);
                $em = $this->getDoctrine()->getManager();
                $em->persist($sportif);
                $em->flush(); 

               
            }
         }

        return $this->render('coachingBundle:coaching:sportif.html.twig', array('form'=> $form->createView()));
    }
    public function coachAction()
    {
        return $this->render('coachingBundle:coaching:coach.html.twig', array());
    }
}
