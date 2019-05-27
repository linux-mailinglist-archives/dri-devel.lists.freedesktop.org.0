Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7C92B3A6
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 13:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FD18991A;
	Mon, 27 May 2019 11:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 401858991A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:54:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3749172167; Mon, 27 May 2019 11:54:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110712] [regression]Raven Ridge: System freeze but mouse cursor
 able to move when using Firefox Webrender.
Date: Mon, 27 May 2019 11:54:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component product qa_contact version
Message-ID: <bug-110712-502-4oFbdY3PrX@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110712-502@http.bugs.freedesktop.org/>
References: <bug-110712-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1589186335=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1589186335==
Content-Type: multipart/alternative; boundary="15589580490.70Bc.8124"
Content-Transfer-Encoding: 7bit


--15589580490.70Bc.8124
Date: Mon, 27 May 2019 11:54:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110712

Haxk20 <haxk612@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|DRM/AMDgpu                  |Drivers/Gallium/radeonsi
            Product|DRI                         |Mesa
         QA Contact|                            |dri-devel@lists.freedesktop
                   |                            |.org
            Version|XOrg git                    |git

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589580490.70Bc.8124
Date: Mon, 27 May 2019 11:54:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:haxk612&#=
64;gmail.com" title=3D"Haxk20 &lt;haxk612&#64;gmail.com&gt;"> <span class=
=3D"fn">Haxk20</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression]Raven Ridge: System freeze but mouse cursor a=
ble to move when using Firefox Webrender."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110712">bug 11071=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/AMDgpu
           </td>
           <td>Drivers/Gallium/radeonsi
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Product</td>
           <td>DRI
           </td>
           <td>Mesa
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>
               &nbsp;
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Version</td>
           <td>XOrg git
           </td>
           <td>git
           </td>
         </tr></table>
      <p>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589580490.70Bc.8124--

--===============1589186335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1589186335==--
