Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF371A958
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 22:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DD889B48;
	Sat, 11 May 2019 20:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 387AA89B51
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 20:07:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 34865721CD; Sat, 11 May 2019 20:07:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 104604] [amdgpu/radeon][regression, CIK] Prefetch the compute
 shader to TC L2 (4a4ff66dbe) causes GPU VM errors when running OpenCL kernels
 on Hawaii
Date: Sat, 11 May 2019 20:07:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 17.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: jv356@scarletmail.rutgers.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: blocked
Message-ID: <bug-104604-502-1NxrkdXLwa@http.bugs.freedesktop.org/>
In-Reply-To: <bug-104604-502@http.bugs.freedesktop.org/>
References: <bug-104604-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0424250596=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0424250596==
Content-Type: multipart/alternative; boundary="15576052632.01c0AF0.1844"
Content-Transfer-Encoding: 7bit


--15576052632.01c0AF0.1844
Date: Sat, 11 May 2019 20:07:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104604

Jan Vesely <jv356@scarletmail.rutgers.edu> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Blocks|                            |99553


Referenced Bugs:

https://bugs.freedesktop.org/show_bug.cgi?id=3D99553
[Bug 99553] Tracker bug for runnning OpenCL applications on Clover
--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15576052632.01c0AF0.1844
Date: Sat, 11 May 2019 20:07:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jv356&#64=
;scarletmail.rutgers.edu" title=3D"Jan Vesely &lt;jv356&#64;scarletmail.rut=
gers.edu&gt;"> <span class=3D"fn">Jan Vesely</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu/radeon][regression, CIK] Prefetch the compute sha=
der to TC L2 (4a4ff66dbe) causes GPU VM errors when running OpenCL kernels =
on Hawaii"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104604">bug 10460=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Blocks</td>
           <td>
               &nbsp;
           </td>
           <td>99553
           </td>
         </tr></table>
      <p>
      </p>

        <div id=3D"referenced">
          <hr style=3D"border: 1px dashed #969696">
          <b>Referenced Bugs:</b>
          <ul>
              <li>
                [<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Tracker bug for runnning OpenCL applications on Clover"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99553">Bug 99553<=
/a>] Tracker bug for runnning OpenCL applications on Clover
              </li>
          </ul>
        </div>
        <br>

      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15576052632.01c0AF0.1844--

--===============0424250596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0424250596==--
