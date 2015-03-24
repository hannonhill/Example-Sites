#Bootstrap

Responsive Web Design (RWD) is an approach that strives to provide an ideal viewing experience for a wide variety of devices. A site designed with RWD principles attempts to respond to each device accessing the content, and adapts the layout to fit the user's display.

Like many frameworks, Bootstrap offers a fluid (or fixed) grid system that scales as the device size changes. Bootstrap's grid system is based on 12 columns and includes predefined classes for easy layout options.

The question is, how do you structure your Cascade Server implementation to easily allow content contributors to create and edit responsive content that uses the framework's expected XHTML markup? And the answer lies within the power of the Data Definition and Format.

##Examples

###Basic

The two basic examples involve working with a dynamic number of WYSIWYGs for a single row. The number of WYSIWYGs present determines how many columns the layout will have. There are two methods to implement this example available.

###Rows

Taking a step forward adds the option of having multiple rows using the same WYSIWYG logic from the basic example.

###Advanced

The final step adds more types of content than just a WYSIWYG for each column in the rows. Users can choose from text headings, images, links, WYSIWYGs, and block content.

###Rows Sidebar

The Rows example using a different Template that has a dynamic navigation.

###Advanced Sidebar

The Advanced example using a different Template that has a dynamic navigation.

##Code

The examples are built in XSLT and Velocity to offer more options.