Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E455158C3
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4645889CB2;
	Tue,  7 May 2019 05:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1AB0989CAC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:10:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 12F737215A; Tue,  7 May 2019 05:10:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 37274] Crash in draw_llvm_shader23 (r300g, rs690, in warzone2100)
Date: Tue, 07 May 2019 05:10:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to component
Message-ID: <bug-37274-502-r7hxQL6zmt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-37274-502@http.bugs.freedesktop.org/>
References: <bug-37274-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1491042489=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1491042489==
Content-Type: multipart/alternative; boundary="15572058140.35ab1a9b1.17920"
Content-Transfer-Encoding: 7bit


--15572058140.35ab1a9b1.17920
Date: Tue, 7 May 2019 05:10:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D37274

Timothy Arceri <t_arceri@yahoo.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|mesa-dev@lists.freedesktop. |dri-devel@lists.freedesktop
                   |org                         |.org
          Component|Mesa core                   |Drivers/Gallium/r300

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572058140.35ab1a9b1.17920
Date: Tue, 7 May 2019 05:10:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:t_arceri&=
#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.com.au&gt;=
"> <span class=3D"fn">Timothy Arceri</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in draw_llvm_shader23 (r300g, rs690, in warzone2100=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D37274">bug 37274<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Mesa core
           </td>
           <td>Drivers/Gallium/r300
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

--15572058140.35ab1a9b1.17920--

--===============1491042489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1491042489==--
