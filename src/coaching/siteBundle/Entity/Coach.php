<?php

namespace coaching\siteBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Coach
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="coaching\siteBundle\Entity\CoachRepository")
 */
class Coach
{
    /* RELATIONS */
    
    /**
    * @ORM\OneToOne(targetEntity="coaching\siteBundle\Entity\User")
    * @ORM\JoinColumn(nullable=false)
    */
    private $user;

    /**
   * @ORM\ManyToMany(targetEntity="coaching\siteBundle\Entity\Training")
   * @ORM\JoinColumn(nullable=false)
   */
    private $training;


    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var float
     *
     * @ORM\Column(name="tarif", type="float")
     */
    private $tarif;

    /**
     * @var boolean
     *
     * @ORM\Column(name="sexe", type="boolean")
     */
    private $sexe;


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
     * Set tarif
     *
     * @param float $tarif
     * @return Coach
     */
    public function setTarif($tarif)
    {
        $this->tarif = $tarif;

        return $this;
    }

    /**
     * Get tarif
     *
     * @return float 
     */
    public function getTarif()
    {
        return $this->tarif;
    }

    /**
     * Set sexe
     *
     * @param boolean $sexe
     * @return Coach
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
        return $this->sexe;
    }
}
