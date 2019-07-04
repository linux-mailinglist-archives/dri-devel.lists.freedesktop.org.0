Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983E5F618
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 11:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AB56E29E;
	Thu,  4 Jul 2019 09:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E17E6E29E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 09:56:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 620C572167; Thu,  4 Jul 2019 09:56:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111060] Dying Light does start but doesnt render properly.
Date: Thu, 04 Jul 2019 09:56:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111060-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1175182427=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1175182427==
Content-Type: multipart/alternative; boundary="15622341760.72fB9.3306"
Content-Transfer-Encoding: 7bit


--15622341760.72fB9.3306
Date: Thu, 4 Jul 2019 09:56:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111060

            Bug ID: 111060
           Summary: Dying Light does start but doesnt render properly.
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: haxk612@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

I have installed Dying Light few days ago. I know there were some issues wi=
th
mesa and dying light but now i heard that most of them are fixed.
So i started it and it crashed. So i used the dying light shim provided in
other bug report and the game launched bug not even the video was rendered
properly. It wasnt rendered to entire screen but only to one quarter in down
right of the screen. And the entire quarter was displaying only one color a=
s if
it was showing only one pixel.
Im using AMD_DEBUG=3Dnir variable so i was thinking that may be the issue.
Disabling it didnt help and the same issue happened.
Launching the game from pure executable showed that i was missing one libra=
ry.
Installing that library didnt help and same issue and trying again the
executable it shows FATAL ERROR cannot initialize renderer.
Its weird as i have not seen this issue anywhere else.
Hardware:
CPU Ryzen 5 2500U
GPU Radeon RX560X
Using LLVM from git and mesa built from git too.
If you need any logs or anything of that matter im happy to provide it all.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15622341760.72fB9.3306
Date: Thu, 4 Jul 2019 09:56:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Dying Light does start but doesnt render properly."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111060">111060</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dying Light does start but doesnt render properly.
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>haxk612&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have installed Dying Light few days ago. I know there were s=
ome issues with
mesa and dying light but now i heard that most of them are fixed.
So i started it and it crashed. So i used the dying light shim provided in
other bug report and the game launched bug not even the video was rendered
properly. It wasnt rendered to entire screen but only to one quarter in down
right of the screen. And the entire quarter was displaying only one color a=
s if
it was showing only one pixel.
Im using AMD_DEBUG=3Dnir variable so i was thinking that may be the issue.
Disabling it didnt help and the same issue happened.
Launching the game from pure executable showed that i was missing one libra=
ry.
Installing that library didnt help and same issue and trying again the
executable it shows FATAL ERROR cannot initialize renderer.
Its weird as i have not seen this issue anywhere else.
Hardware:
CPU Ryzen 5 2500U
GPU Radeon RX560X
Using LLVM from git and mesa built from git too.
If you need any logs or anything of that matter im happy to provide it all.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15622341760.72fB9.3306--

--===============1175182427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1175182427==--
