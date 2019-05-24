Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0831428ED2
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 03:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5906E030;
	Fri, 24 May 2019 01:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C08E36E030
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:32:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B28B372167; Fri, 24 May 2019 01:32:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110749] [Vega 11] [amdgpu retry page fault
 VM_L2_PROTECTION_FAULT_STATUS] System lock up during playing Steam version of
 Saints Row 3
Date: Fri, 24 May 2019 01:32:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: evvke@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: priority
Message-ID: <bug-110749-502-ZyKUO4Szis@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110749-502@http.bugs.freedesktop.org/>
References: <bug-110749-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1507345509=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1507345509==
Content-Type: multipart/alternative; boundary="15586615780.7dc2.3046"
Content-Transfer-Encoding: 7bit


--15586615780.7dc2.3046
Date: Fri, 24 May 2019 01:32:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110749

Cyrax <evvke@hotmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |highest

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586615780.7dc2.3046
Date: Fri, 24 May 2019 01:32:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:evvke&#64=
;hotmail.com" title=3D"Cyrax &lt;evvke&#64;hotmail.com&gt;"> <span class=3D=
"fn">Cyrax</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT=
_STATUS] System lock up during playing Steam version of Saints Row 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110749">bug 11074=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>highest
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

--15586615780.7dc2.3046--

--===============1507345509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1507345509==--
