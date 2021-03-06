<?php

namespace coaching\siteBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Sportif
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="coaching\siteBundle\Entity\SportifRepository")
 */
class Sportif
{

    /**
    * @ORM\OneToOne(targetEntity="coaching\siteBundle\Entity\User")
    * @ORM\JoinColumn(nullable=false)
    */
    private $user;

    /**
    * @ORM\OneToOne(targetEntity="coaching\siteBundle\Entity\Training")
    * @ORM\JoinColumn(nullable=true)
    */
    private $training;

     /**
    * @ORM\OneToOne(targetEntity="coaching\siteBundle\Entity\Coach")
    * @ORM\JoinColumn(nullable=true)
    */
    private $coach;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="taille", type="integer")
     */
    private $taille;

    /**
     * @var float
     *
     * @ORM\Column(name="poids", type="float")
     */
    private $poids;

    /**
     * @var boolean
     *
     * @ORM\Column(name="sexe", type="boolean")
     */
    private $sexe;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_naissance", type="date")
     */
    private $dateNaissance;

    /**
     * @var string
     *
     * @ORM\Column(name="niveau", type="string", length=255)
     */
    private $niveau;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set taille
     *
     * @param integer $taille
     * @return Sportif
     */
    public function setTaille($taille)
    {
        $this->taille = $taille;

        return $this;
    }

    /**
     * Get taille
     *
     * @return integer 
     */
    public function getTaille()
    {
        return $this->taille;
    }

    /**
     * Set poids
     *
     * @param float $poids
     * @return Sportif
     */
    public function setPoids($poids)
    {
        $this->poids = $poids;

        return $this;
    }

    /**
     * Get poids
     *
     * @return float 
     */
    public function getPoids()
    {
        return $this->poids;
    }

    /**
     * Set sexe
     *
     * @param boolean $sexe
     * @return Sportif
     */
    public function setSexe($sexe)
    {
        $this->sexe = $sexe;

        return $this;
    }

    /**
     * Get sexe
     *
     * @return boolean 
     */
    public function getSexe()
    {
        if($this->sexe==0)
            $genre="Féminin";
        else
            $genre="Masculin";

        return $genre;
    }

    /**
     * Set dateNaissance
     *
     * @param \DateTime $dateNaissance
     * @return Sportif
     */
    public function setDateNaissance($dateNaissance)
    {
        $this->dateNaissance = $dateNaissance;

        return $this;
    }

    /**
     * Get dateNaissance
     *
     * @return \DateTime 
     */
    public function getDateNaissance()
    {
        return $this->dateNaissance;
    }

    /**
     * Set niveau
     *
     * @param string $niveau
     * @return Sportif
     */
    public function setNiveau($niveau)
    {
        $this->niveau = $niveau;

        return $this;
    }

    /**
     * Get niveau
     *
     * @return string 
     */
    public function getNiveau()
    {
        return $this->niveau;
    }

    public function setUser($id)
    {
        $this->user=$id;
        return $this;
    }

    public function getUser()
    {
        return $this->user;
    }

    public function setTraining($training)
    {
        $this->training=$training;
        return $this;
    }
    
    public function getTraining()
    {
        return $this->training;
    }

}
