<div class="accordion-panel cols-fixed-sidebar accordion-animation">
    <div class="search">
        <ej:Autocomplete runat="server" WatermarkText="Search here" ShowPopupButton="true" ID="auto" CssClass="autotext" ClientIDMode="Static" />
    </div>
    <div id="dashboardheader">
        <div id="sbdashboard" class="dashboardhead">
            <span class="anchor">SHOWCASE SAMPLES</span>
        </div>
    </div>
    <div id="scrollcontainer">
        <div>
            <div class="accordion" id="accordion2">
            </div>		
			<script id="accordionGroupTmpl" type="text/x-jsrender">
			<div class="SB-groupIt downArrow"><span>{{:#view.data}}</span><span class="SB-Arrow"></span></div>
			<div class="SB-group {{RemoveWhiteSpace:#view.data}}"></div>
            </script>
            <script id="accordionTmpl" type="text/x-jsrender">
                <div id="{{ensureURL:id}}" class="anchorclass mainlevels {{if isResponsive == 'false'}} responsive-viewable {{/if}}" hashbang="/{{>controller}}/{{ensureURL:action}}">
                    {{if id =="Analytics"}}
                         <a href='#'>{{else}}
						<a href="{{:~location}}{{ensureURL:id}}/{{ensureURL:action}}.aspx">{{/if}}
                             <div class="dashboard">
                                 <span class="anchor">{{>name}}</span>
                                 {{if type}} <span class="samplestatus {{>type}}"></span>{{/if}}
                             </div>
                        </a>
                </div>
            </script>
            <div class="accordion samplesCollection" id="samplesDiv">
            </div>
            <script type="text/x-jsrender" id="accordionTmplchild">
                <div id="{{ensureURL:id}}" class="samples">
                    <a href="{{:~location}}default.aspx">
                    <div id="{{>id}}_back" class="firstlevelback dashboardhead">
                            <span class="arrowback"></span><span class="anchor sbheading">ALL CONTROLS</span>
                    </div></a>
                    <div id="{{>id}}_header" class="current_control dashboardhead">
                        <span class="anchor sbheading">{{>name}}</span>
                    </div>
                    {{for samples ~pId=id name}} 
                                           
				        {{if samples}}
											    <div class="SB-groupIt downArrow">
                                                    <span>{{Upperstring:name}}</span>
                                                    <span class="SB-Arrow"></span>
                                                </div>
                    <div id="{{>pId}}" width="200px">
                        {{for samples ~rId=~pId }}                                                                                                 
                                                            <div id="{{>id}}" hashbang="/{{ensureURL:controller}}/{{>action}}" class="secondlevelload SB-group SB-hashcollection {{if isResponsive == 'false'}} responsive-viewable {{/if}}" childcount="{{>childcount}}" action="{{>action}}">
                                                                <a href="{{:~location}}{{ensureURL:controller}}/{{ensureURL:action}}.aspx">
                                                                    <div class="dashboard">
                                                                        <span class="anchor">{{>name}}</span>
                                                                        {{if type}} <span class="samplestatus {{>type}}"></span>{{/if}}
                                                                    </div>
                                                                </a>
                                                            </div>
                        {{/for}}
                    </div>
                    {{else}}
											 <div id="{{>id}}" class="firstlevelload  SB-hashcollection {{if isResponsive == 'false'}} responsive-viewable {{/if}}" childcount="{{>childcount}}" controller="{{>~pId}}" action="{{>action}}">
                                                 <a href="{{:~location}}{{ensureURL:~pId}}/{{ensureURL:action}}.aspx">
                                                     <div class="dashboard">
                                                         <span class="anchor">{{>name}}</span>
                                                         {{if type}} <span class="samplestatus {{>type}}"></span>{{/if}}
                                                     </div>
                                                 </a>
                                             </div>
                    {{/if}}
                {{/for}}
                </div>
            </script>
            <div id="subsamplesDiv" style="display: none">
            </div>
        </div>
    </div>
</div>
