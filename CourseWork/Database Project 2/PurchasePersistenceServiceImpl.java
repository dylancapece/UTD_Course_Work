package cs4347.hibernateProject.ecomm.services.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import cs4347.hibernateProject.ecomm.entity.Purchase;
import cs4347.hibernateProject.ecomm.services.PurchasePersistenceService;
import cs4347.hibernateProject.ecomm.services.PurchaseSummary;
import cs4347.hibernateProject.ecomm.util.DAOException;

public class PurchasePersistenceServiceImpl implements PurchasePersistenceService
{
	@PersistenceContext
	public EntityManager em;

	@Override
	public void create(Purchase purchase) throws SQLException, DAOException
	{
		try {
			em.getTransaction().begin();
			em.persist(purchase);
			em.getTransaction().commit();
		}
		catch (Exception ex) {
			em.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public Purchase retrieve(Long id) throws SQLException, DAOException
	{
		try {
			em.getTransaction().begin();
			Purchase purch= em.find(Purchase.class, id);
			em.getTransaction().commit();
			return purch;
		}
		catch (Exception ex) {
			em.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(Purchase purchase) throws SQLException, DAOException
	{
		try {
			em.getTransaction().begin();
			Purchase purch = em.find(Purchase.class, purchase.getId());
			purch.setPurchaseAmount(purchase.getPurchaseAmount());
			purch.setPurchaseDate(purchase.getPurchaseDate());
			purch.setCustomer(purchase.getCustomer());
			purch.setProduct(purchase.getProduct());
			em.getTransaction().commit();
		}
		catch (Exception ex) {
			em.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Long id) throws SQLException, DAOException
	{
		em.getTransaction().begin();
		Purchase purch = (Purchase)em.createQuery("from Purchase as p where p.id = :id")
				.setParameter("id", id)
				.getSingleResult();

		if(purch == null) {
			em.getTransaction().rollback();
			throw new DAOException("Purchase ID Not Found " + id);
		}

		em.remove(purch);
		em.getTransaction().commit();
	}

	@Override
	public List<Purchase> retrieveForCustomerID(Long customerID) throws SQLException, DAOException
	{
		if((customerID < 0)){
			throw new DAOException("Invalid customer ID provided");
		}
		List<Purchase> listofpurch = em.createQuery("from Purchase as p where p.customer.id = :custID")
				.setParameter("custID", customerID)
				.getResultList();

		return listofpurch;
	}

	@Override
	public List<Purchase> retrieveForProductID(Long productID) throws SQLException, DAOException
	{
		if((productID < 0)){
			throw new DAOException("Invalid product ID provided");
		}
		List<Purchase> listofpurch = em.createQuery("from Purchase as p where p.product.id = :prodID")
				.setParameter("prodID", productID)
				.getResultList();

		return listofpurch;
	}

	@Override
	public PurchaseSummary retrievePurchaseSummary(Long customerID) throws SQLException, DAOException
	{
		List<Purchase> PurchSumm = new ArrayList<Purchase>();
		PurchSumm = retrieveForCustomerID(customerID);
		PurchaseSummary result = new PurchaseSummary();
		double minimum = 999999999999.99;
		double maximum = 0;
		double sum = 0;
		for(Purchase purch : PurchSumm){
			double currentValue = purch.getPurchaseAmount();
			if(currentValue < minimum){
				minimum = currentValue;
			}
			if(currentValue > maximum){
				maximum = currentValue;
			}
			sum += currentValue;
		}
		double avg = (sum / PurchSumm.size());
		result.minPurchase = (float)minimum;
		result.maxPurchase = (float)maximum;
		result.avgPurchase = (float)avg;

		return result;
	}
}
