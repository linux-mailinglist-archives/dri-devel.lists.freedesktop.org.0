Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9AFF792
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 05:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519276E217;
	Sun, 17 Nov 2019 04:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 250D36E20C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 04:52:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1B7D3720E2; Sun, 17 Nov 2019 04:52:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112304] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout causes system freeze
Date: Sun, 17 Nov 2019 04:52:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: saadnaji89@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-112304-502-zrJTB1SnJD@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112304-502@http.bugs.freedesktop.org/>
References: <bug-112304-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1275212050=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1275212050==
Content-Type: multipart/alternative; boundary="15739663690.FD65E2.21658"
Content-Transfer-Encoding: 7bit


--15739663690.FD65E2.21658
Date: Sun, 17 Nov 2019 04:52:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112304

--- Comment #6 from saadnaji89@gmail.com ---
Created attachment 145980
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145980&action=3Dedit
journalctl-logs-after-hardware-reboot

I believe this important clue. Here is the journalctl logs right after hard=
ware
powering off when my system froze during gameplay. You can see the logs the=
re
repetitive. There a lot of page=20=20
tables and includes GPU failure=20

e.g=20
chrome_ChildIOT: Corrupted page table at address 1689e6ba5e10

drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process  pid=
 0
thread  pid 0
Nov 16 23:41:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma0 timeout, signaled seq=3D112, emitted seq=3D11

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739663690.FD65E2.21658
Date: Sun, 17 Nov 2019 04:52:49 +0000
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
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut causes system freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut causes system freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304">bug 11230=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
saadnaji89&#64;gmail.com" title=3D"saadnaji89&#64;gmail.com">saadnaji89&#64=
;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145980=
" name=3D"attach_145980" title=3D"journalctl-logs-after-hardware-reboot">at=
tachment 145980</a> <a href=3D"attachment.cgi?id=3D145980&amp;action=3Dedit=
" title=3D"journalctl-logs-after-hardware-reboot">[details]</a></span>
journalctl-logs-after-hardware-reboot

I believe this important clue. Here is the journalctl logs right after hard=
ware
powering off when my system froze during gameplay. You can see the logs the=
re
repetitive. There a lot of page=20=20
tables and includes GPU failure=20

e.g=20
chrome_ChildIOT: Corrupted page table at address 1689e6ba5e10

drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process  pid=
 0
thread  pid 0
Nov 16 23:41:49 archlinux kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring sdma0 timeout, signaled seq=3D112, emitted seq=3D11</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739663690.FD65E2.21658--

--===============1275212050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1275212050==--
