Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E270ABF998
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 20:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481066EDE2;
	Thu, 26 Sep 2019 18:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C20D56EDE2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 18:50:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BE78D72162; Thu, 26 Sep 2019 18:50:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111803] Annoying GPU stucks are continued on Vega 20 with
 Kernel 5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail
 [amdgpu]] *ERROR* Waiting for fences timed out!
Date: Thu, 26 Sep 2019 18:50:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111803-502-CLFFtG1X3E@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111803-502@http.bugs.freedesktop.org/>
References: <bug-111803-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1836569880=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1836569880==
Content-Type: multipart/alternative; boundary="15695238430.834f9aBf0.18473"
Content-Transfer-Encoding: 7bit


--15695238430.834f9aBf0.18473
Date: Thu, 26 Sep 2019 18:50:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111803

--- Comment #13 from mikhail.v.gavrilov@gmail.com ---
Created attachment 145533
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145533&action=3Dedit
./umr -O many,bits -r *.*.mmCP_PFP_HEADER_DUMP

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695238430.834f9aBf0.18473
Date: Thu, 26 Sep 2019 18:50:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *=
ERROR* Waiting for fences timed out!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111803#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *=
ERROR* Waiting for fences timed out!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111803">bug 11180=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikhail.v.gavrilov&#64;gmail.com" title=3D"mikhail.v.gavrilov&#64;gmail.com=
">mikhail.v.gavrilov&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145533=
" name=3D"attach_145533" title=3D"./umr -O many,bits -r *.*.mmCP_PFP_HEADER=
_DUMP">attachment 145533</a> <a href=3D"attachment.cgi?id=3D145533&amp;acti=
on=3Dedit" title=3D"./umr -O many,bits -r *.*.mmCP_PFP_HEADER_DUMP">[detail=
s]</a></span>
./umr -O many,bits -r *.*.mmCP_PFP_HEADER_DUMP</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695238430.834f9aBf0.18473--

--===============1836569880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1836569880==--
