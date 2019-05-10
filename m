Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A1A19C04
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 12:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEE489298;
	Fri, 10 May 2019 10:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 818608929D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 10:55:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7E4637215A; Fri, 10 May 2019 10:55:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110248] IGT Meson build fails when "-Dbuild_tests=false" option
 is used
Date: Fri, 10 May 2019 10:55:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: petri.latvala@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-110248-502-XquEJBjz5S@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110248-502@http.bugs.freedesktop.org/>
References: <bug-110248-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1545986682=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1545986682==
Content-Type: multipart/alternative; boundary="15574857383.ac3dFd.25105"
Content-Transfer-Encoding: 7bit


--15574857383.ac3dFd.25105
Date: Fri, 10 May 2019 10:55:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110248

Petri Latvala <petri.latvala@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Petri Latvala <petri.latvala@intel.com> ---
commit 159c69e5318e934b5f1d83939191c8756280b758
Author: Petri Latvala <petri.latvala@intel.com>
Date:   Fri Apr 26 14:05:41 2019 +0300

    runner: Disable building if tests are not built

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574857383.ac3dFd.25105
Date: Fri, 10 May 2019 10:55:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:petri.lat=
vala&#64;intel.com" title=3D"Petri Latvala &lt;petri.latvala&#64;intel.com&=
gt;"> <span class=3D"fn">Petri Latvala</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - IGT Meson build fails when &quot;-Dbuild_tests=
=3Dfalse&quot; option is used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110248">bug 11024=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - IGT Meson build fails when &quot;-Dbuild_tests=
=3Dfalse&quot; option is used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110248#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - IGT Meson build fails when &quot;-Dbuild_tests=
=3Dfalse&quot; option is used"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110248">bug 11024=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
petri.latvala&#64;intel.com" title=3D"Petri Latvala &lt;petri.latvala&#64;i=
ntel.com&gt;"> <span class=3D"fn">Petri Latvala</span></a>
</span></b>
        <pre>commit 159c69e5318e934b5f1d83939191c8756280b758
Author: Petri Latvala &lt;<a href=3D"mailto:petri.latvala&#64;intel.com">pe=
tri.latvala&#64;intel.com</a>&gt;
Date:   Fri Apr 26 14:05:41 2019 +0300

    runner: Disable building if tests are not built</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574857383.ac3dFd.25105--

--===============1545986682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1545986682==--
