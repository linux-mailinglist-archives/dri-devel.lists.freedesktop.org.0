Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE37AAA0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 16:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80396E550;
	Tue, 30 Jul 2019 14:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD83E6E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:10:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B9C7672167; Tue, 30 Jul 2019 14:10:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110488] [1042669.035207] [drm:amdgpu_job_timedout [amdgpu]]
 *ERROR* ring vce0 timeout, signaled seq=4, emitted seq=8
Date: Tue, 30 Jul 2019 14:10:43 +0000
X-Bugzilla-Reason: CC AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: a9016009@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_severity priority
Message-ID: <bug-110488-502-vuipilWIAi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110488-502@http.bugs.freedesktop.org/>
References: <bug-110488-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1506893232=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1506893232==
Content-Type: multipart/alternative; boundary="15644958430.EEB7.17644"
Content-Transfer-Encoding: 7bit


--15644958430.EEB7.17644
Date: Tue, 30 Jul 2019 14:10:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110488

Andre Klapper <a9016009@gmx.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|blocker                     |normal
           Priority|highest                     |medium

--- Comment #3 from Andre Klapper <a9016009@gmx.de> ---
yanhua: Resetting priority and severity if you do not plan to work on fixing
this.

--=20
You are receiving this mail because:
You are on the CC list for the bug.
You are the assignee for the bug.=

--15644958430.EEB7.17644
Date: Tue, 30 Jul 2019 14:10:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:a9016009&=
#64;gmx.de" title=3D"Andre Klapper &lt;a9016009&#64;gmx.de&gt;"> <span clas=
s=3D"fn">Andre Klapper</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [1042669.035207] [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* ring vce0 timeout, signaled seq=3D4, emitted seq=3D8"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110488">bug 11048=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>blocker
           </td>
           <td>normal
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>highest
           </td>
           <td>medium
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [1042669.035207] [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* ring vce0 timeout, signaled seq=3D4, emitted seq=3D8"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110488#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [1042669.035207] [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R* ring vce0 timeout, signaled seq=3D4, emitted seq=3D8"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110488">bug 11048=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
a9016009&#64;gmx.de" title=3D"Andre Klapper &lt;a9016009&#64;gmx.de&gt;"> <=
span class=3D"fn">Andre Klapper</span></a>
</span></b>
        <pre>yanhua: Resetting priority and severity if you do not plan to =
work on fixing
this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are on the CC list for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15644958430.EEB7.17644--

--===============1506893232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1506893232==--
