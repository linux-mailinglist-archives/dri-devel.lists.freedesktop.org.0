Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B001A860F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 17:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FDD89B61;
	Wed,  4 Sep 2019 15:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3861789B61
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 15:31:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2BC1172161; Wed,  4 Sep 2019 15:31:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107538] Intel-gpu-tools 1.23 tag fails compilation on Clang due
 to implicit declaration of function
Date: Wed, 04 Sep 2019 15:31:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matthew.d.roper@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-107538-502-CiAaooiOx4@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107538-502@http.bugs.freedesktop.org/>
References: <bug-107538-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1763462481=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1763462481==
Content-Type: multipart/alternative; boundary="15676110690.bBD30B50.10475"
Content-Transfer-Encoding: 7bit


--15676110690.bBD30B50.10475
Date: Wed, 4 Sep 2019 15:31:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107538

Matt Roper <matthew.d.roper@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Matt Roper <matthew.d.roper@intel.com> ---
As you noted, Lucas landed a patch shortly after the 1.23 release that
addressed this.  Since that time an official 1.24 release has come out, so I
don't believe there's anything further that needs to be done with this bug.=
=20
Closing as resolved.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676110690.bBD30B50.10475
Date: Wed, 4 Sep 2019 15:31:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:matthew.d=
.roper&#64;intel.com" title=3D"Matt Roper &lt;matthew.d.roper&#64;intel.com=
&gt;"> <span class=3D"fn">Matt Roper</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Intel-gpu-tools 1.23 tag fails compilation on =
Clang due to implicit declaration of function"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107538">bug 10753=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Intel-gpu-tools 1.23 tag fails compilation on =
Clang due to implicit declaration of function"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107538#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Intel-gpu-tools 1.23 tag fails compilation on =
Clang due to implicit declaration of function"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107538">bug 10753=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
matthew.d.roper&#64;intel.com" title=3D"Matt Roper &lt;matthew.d.roper&#64;=
intel.com&gt;"> <span class=3D"fn">Matt Roper</span></a>
</span></b>
        <pre>As you noted, Lucas landed a patch shortly after the 1.23 rele=
ase that
addressed this.  Since that time an official 1.24 release has come out, so I
don't believe there's anything further that needs to be done with this bug.=
=20
Closing as resolved.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676110690.bBD30B50.10475--

--===============1763462481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1763462481==--
