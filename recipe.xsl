<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<?xml-stylesheet href="style.css"?>
<xsl:output method="html"/>
<xsl:template match="/">
<html>
	<head>
		<title> Chef Master Recipes</title>
	</head>
	<body style="font: arial, sans-serif; margin: 1% 0; padding: 10px;">
		<link rel="stylesheet" type="text/css" href= "style.css" />
		<header class= "header">
			<div class="wrapper">
				<h1 style="text-align:center"> <u>Chef Master Recipes </u></h1>
			</div>
		</header>
      <nav class= "menu">
        <div class="wrapper">
        <ul>
            <img src="./images/spoon.jpg" width="30" height="30" />
            <a href="./index.html" target="_blank"><li>Home</li></a>
            <a href="./glutenrecipe.xml" target="_blank"><li>Gluten Free Recipes</li></a>
            <a href="./asianrecipe.xml" target="_blank"><li>Asian Recipe</li></a>
            <a href="./submitrecipe.html" target="_blank"><li> Submit Recipe</li></a>
            <a href="./contact.html" target="_blank"><li>Contact Us</li></a>
            <a href="./about.html" target="_blank"><li>About Us</li></a>
          </ul>
        </div>
      </nav>
		<xsl:for-each select="recipes/recipe">
			<xsl:sort select="title"/>
        <div class="main">
          <div class="wrapper">
            <h3 style ="color:purple"> Category:<u><xsl:value-of select="category"/></u></h3>
            <h4 style="color:darkblue">Recipe Name:<xsl:value-of select="title"/></h4> 
            <p style ="color:darkblue"><xsl:value-of select="description"/></p> 
            <div class="recipes">
               <xsl:apply-templates select="poster" />
            </div>
            
            <p style ="color:darkblue"> Main Ingredient: <xsl:value-of select="group"/></p>
            <p style ="color:darkblue">Origin of Recipe: <xsl:value-of select="countryoforigin"/></p>
            <p style ="color:darkblue">Time to cook:<xsl:value-of select="timetocook"/></p>
            <p style ="color:darkblue">Serves:<xsl:value-of select="serves"/></p>
            
            <p style ="color:darkblue"><b>Ingredients:</b></p>
            <xsl:for-each select="ingredient">  
                <p style ="color:darkblue"> -> <xsl:value-of select="text()"/> <br/></p>
            </xsl:for-each>
            <p style ="color:darkblue"><b>Directions: </b><xsl:value-of select="direction" /> </p>
            <p style ="color:darkblue">Recipe Contributed by: <xsl:value-of select= "composer/@title"/><xsl:value-of select= "composer/@fname"/><xsl:value-of select= "composer/@lname"/>
            From <xsl:value-of select= "composer/@country"/> on <xsl:value-of select="date"/></p>
            <div class="poster">
               <xsl:apply-templates select="picture" />
            </div>
            <p style ="color:darkblue">Special Tip:<xsl:value-of select="recommendation"/></p>
            <p style ="color:darkblue">More details on Main Ingredients can be found at: <a href="{link/url}"><xsl:value-of select="link/@url" /> </a></p>
          </div>
        </div>
		</xsl:for-each>
    <footer class="footer">
        <div class="wrapper">
          <p> &#169;Healthy Nutritional Recipes. All rights reserved , Copyright Newcastle University 2020<br/> Akshata Dhuraji, SENG1050, University of NewCastle, <u>Email:c3309266@uon.edu.au</u> </p>
        </div>
    </footer>
	</body>
</html>
</xsl:template>
  <xsl:template match="picture">
	   <img src="{@url}" height="{@height}" width="{@width}" />
  </xsl:template>
  <xsl:template match="poster">
	   <img src="{@url}" height="{@height}" width="{@width}" />
  </xsl:template>
</xsl:stylesheet>