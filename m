Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E725F2DE7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 13:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ED36F66F;
	Thu,  7 Nov 2019 12:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3FDF6F672
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 12:06:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A0B89720E2; Thu,  7 Nov 2019 12:06:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110823] [Intel-GFX-CI][BAT] igt@amdgpu/amd_basic@userptr - fail
 - Failed assertion: r == 0
Date: Thu, 07 Nov 2019 12:06:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chris@chris-wilson.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110823-502-MsKIfUfmBp@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110823-502@http.bugs.freedesktop.org/>
References: <bug-110823-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0409796482=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0409796482==
Content-Type: multipart/alternative; boundary="15731283952.DBE28aAB7.18102"
Content-Transfer-Encoding: 7bit


--15731283952.DBE28aAB7.18102
Date: Thu, 7 Nov 2019 12:06:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110823

Chris Wilson <chris@chris-wilson.co.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Chris Wilson <chris@chris-wilson.co.uk> ---
Kernel config update to enable HMM_MIRROR.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731283952.DBE28aAB7.18102
Date: Thu, 7 Nov 2019 12:06:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:chris&#64=
;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wilson.co.uk=
&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Intel-GFX-CI][BAT] igt&#64;amdgpu/amd_basic&#=
64;userptr - fail - Failed assertion: r =3D=3D 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110823">bug 11082=
3</a>
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
   title=3D"RESOLVED FIXED - [Intel-GFX-CI][BAT] igt&#64;amdgpu/amd_basic&#=
64;userptr - fail - Failed assertion: r =3D=3D 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110823#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Intel-GFX-CI][BAT] igt&#64;amdgpu/amd_basic&#=
64;userptr - fail - Failed assertion: r =3D=3D 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110823">bug 11082=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>Kernel config update to enable HMM_MIRROR.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731283952.DBE28aAB7.18102--

--===============0409796482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0409796482==--
