public without sharing class GuestSiteHomeService {
    public List<Contact> selectContact() {
        return new List<Contact>([
            SELECT LastName, Id
            FROM Contact
            LIMIT 1
        ]);
    }

    public void updateContact(Contact cont) {
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new List<SObjectType>{
                Contact.SObjectType
            }
        );

        cont.LastName = cont.LastName + Datetime.now().format();

        uow.registerDirty(cont);
        uow.commitWork();
    }
}