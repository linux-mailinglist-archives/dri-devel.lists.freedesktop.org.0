Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB9123C4
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 22:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B47F897FD;
	Thu,  2 May 2019 20:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C7B689885
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:59:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 568CE7215A; Thu,  2 May 2019 20:59:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108892] kernel BUG at kernel/time/timer.c:1137 in
 drm_sched_job_finish [gpu_sched]
Date: Thu, 02 May 2019 20:59:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: hvtaifwkbgefbaei@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-108892-502-ZUocm4cnqc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108892-502@http.bugs.freedesktop.org/>
References: <bug-108892-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0094484909=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0094484909==
Content-Type: multipart/alternative; boundary="15568307842.cA5498.27293"
Content-Transfer-Encoding: 7bit


--15568307842.cA5498.27293
Date: Thu, 2 May 2019 20:59:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108892

--- Comment #8 from Sami Farin <hvtaifwkbgefbaei@gmail.com> ---
Created attachment 144130
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144130&action=3Dedit
dmesg

4.19.37 has this bug also.

Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Lexa PRO [Radeon RX
550/550X] driver: amdgpu v: kernel=20
           Display: server: Fedora Project X.org 1.20.4 driver: amdgpu,ati
unloaded: fbdev,modesetting,vesa=20
           resolution: 3840x2160~60Hz=20
           OpenGL: renderer: Radeon 550 Series (POLARIS12 DRM 3.27.0 4.19.3=
8+
LLVM 7.0.1) v: 4.5 Mesa 19.0.3

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15568307842.cA5498.27293
Date: Thu, 2 May 2019 20:59:44 +0000
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
   title=3D"NEW - kernel BUG at kernel/time/timer.c:1137 in drm_sched_job_f=
inish [gpu_sched]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108892#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - kernel BUG at kernel/time/timer.c:1137 in drm_sched_job_f=
inish [gpu_sched]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108892">bug 10889=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hvtaifwkbgefbaei&#64;gmail.com" title=3D"Sami Farin &lt;hvtaifwkbgefbaei&#6=
4;gmail.com&gt;"> <span class=3D"fn">Sami Farin</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144130=
" name=3D"attach_144130" title=3D"dmesg">attachment 144130</a> <a href=3D"a=
ttachment.cgi?id=3D144130&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

4.19.37 has this bug also.

Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Lexa PRO [Radeon RX
550/550X] driver: amdgpu v: kernel=20
           Display: server: Fedora Project X.org 1.20.4 driver: amdgpu,ati
unloaded: fbdev,modesetting,vesa=20
           resolution: 3840x2160~60Hz=20
           OpenGL: renderer: Radeon 550 Series (POLARIS12 DRM 3.27.0 4.19.3=
8+
LLVM 7.0.1) v: 4.5 Mesa 19.0.3</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15568307842.cA5498.27293--

--===============0094484909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0094484909==--
