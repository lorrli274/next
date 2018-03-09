This activity shows how to define a page to delete `Author` objects.

As discussed in the form design section, our strategy will be to only allow deletion of objects that are not referenced by other objects (in this case that means we won't allow an `Author` to be deleted if it is referenced by a `Book`). In terms of implementation this means that the form needs to confirm that there are no associated books before the author is deleted. If there are associated books, it should display them, and state that they must be deleted before the `Author` object can be deleted.
