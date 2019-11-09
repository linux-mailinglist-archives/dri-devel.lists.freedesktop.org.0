Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459AF5E9B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 12:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAEB6E1EE;
	Sat,  9 Nov 2019 11:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D6FD6E1E9
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 11:10:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 170C1720E2; Sat,  9 Nov 2019 11:10:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAxMTExMjRdIFtkcm06YW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFp?=
 =?UTF-8?B?bCBbYW1kZ3B1XV0gKkVSUk9SKiBXYWl0aW5nIGZvciBmZW5jZXMgdGltZWQg?=
 =?UTF-8?B?b3V0IG9yIGludGVycnVwdGVkISBoYXBwZW5zIGV2ZXJ5IHRpbWUgd2hlbiBh?=
 =?UTF-8?B?INGBdXRzY2VuZSBzaG93ZWQgaW4gTWF4IFBheW5lIDM=?=
Date: Sat, 09 Nov 2019 11:10:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harald.linden@thelow.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111124-502-dOoDNorHbb@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111124-502@http.bugs.freedesktop.org/>
References: <bug-111124-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1749909370=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1749909370==
Content-Type: multipart/alternative; boundary="15732978170.5B05cFF.28711"
Content-Transfer-Encoding: 7bit


--15732978170.5B05cFF.28711
Date: Sat, 9 Nov 2019 11:10:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111124

--- Comment #12 from Harald Linden <harald.linden@thelow.net> ---
Created attachment 145920
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145920&action=3Dedit
(KSP) trace-cmd record -e dma_fence -e gpu_scheduler -e amdgpu -v -e
"amdgpu:amdgpu_mm_rreg" -e "amdgpu:amdgpu_mm_wreg" -e "amdgpu:amdgpu_iv"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732978170.5B05cFF.28711
Date: Sat, 9 Nov 2019 11:10:17 +0000
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
   title=3D"NEW - [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiti=
ng for fences timed out or interrupted! happens every time when a =D1=81uts=
cene showed in Max Payne 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111124#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiti=
ng for fences timed out or interrupted! happens every time when a =D1=81uts=
cene showed in Max Payne 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111124">bug 11112=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
harald.linden&#64;thelow.net" title=3D"Harald Linden &lt;harald.linden&#64;=
thelow.net&gt;"> <span class=3D"fn">Harald Linden</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145920=
" name=3D"attach_145920" title=3D"(KSP) trace-cmd record -e dma_fence -e gp=
u_scheduler -e amdgpu -v -e &quot;amdgpu:amdgpu_mm_rreg&quot; -e &quot;amdg=
pu:amdgpu_mm_wreg&quot; -e &quot;amdgpu:amdgpu_iv&quot;">attachment 145920<=
/a> <a href=3D"attachment.cgi?id=3D145920&amp;action=3Dedit" title=3D"(KSP)=
 trace-cmd record -e dma_fence -e gpu_scheduler -e amdgpu -v -e &quot;amdgp=
u:amdgpu_mm_rreg&quot; -e &quot;amdgpu:amdgpu_mm_wreg&quot; -e &quot;amdgpu=
:amdgpu_iv&quot;">[details]</a></span>
(KSP) trace-cmd record -e dma_fence -e gpu_scheduler -e amdgpu -v -e
&quot;amdgpu:amdgpu_mm_rreg&quot; -e &quot;amdgpu:amdgpu_mm_wreg&quot; -e &=
quot;amdgpu:amdgpu_iv&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732978170.5B05cFF.28711--

--===============1749909370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1749909370==--
