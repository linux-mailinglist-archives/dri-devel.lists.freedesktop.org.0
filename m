Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E94782EF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 02:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8895989B0B;
	Mon, 29 Jul 2019 00:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 86F5A89B22
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 00:59:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 839B172167; Mon, 29 Jul 2019 00:59:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110457] System resumes failed and hits [drm:amdgpu_job_timedout
 [amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G
Date: Mon, 29 Jul 2019 00:59:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: redrield@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110457-502-D1L342nFJR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110457-502@http.bugs.freedesktop.org/>
References: <bug-110457-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0371453620=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0371453620==
Content-Type: multipart/alternative; boundary="15643619452.Ae844E.15409"
Content-Transfer-Encoding: 7bit


--15643619452.Ae844E.15409
Date: Mon, 29 Jul 2019 00:59:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110457

--- Comment #9 from redrield@gmail.com ---
Created attachment 144900
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144900&action=3Dedit
Thinkpad E585 log file with amdgpu errors

I'm running into an issue that I think is related to this. Attached a journ=
al
file containing the traces from the last boot where it occurred. For some
reason, it doesn't happen every time I try to resume from suspend, but when=
 it
does I have no choice but to hard reboot. This is a Thinkpad E585, uname -a
"Linux thonkpad 5.2.3-arch1-1-ARCH #1 SMP PREEMPT Fri Jul 26 08:13:47 UTC 2=
019
x86_64 GNU/Linux"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643619452.Ae844E.15409
Date: Mon, 29 Jul 2019 00:59:05 +0000
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
   title=3D"NEW - System resumes failed and hits [drm:amdgpu_job_timedout [=
amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110457#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System resumes failed and hits [drm:amdgpu_job_timedout [=
amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110457">bug 11045=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
redrield&#64;gmail.com" title=3D"redrield&#64;gmail.com">redrield&#64;gmail=
.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144900=
" name=3D"attach_144900" title=3D"Thinkpad E585 log file with amdgpu errors=
">attachment 144900</a> <a href=3D"attachment.cgi?id=3D144900&amp;action=3D=
edit" title=3D"Thinkpad E585 log file with amdgpu errors">[details]</a></sp=
an>
Thinkpad E585 log file with amdgpu errors

I'm running into an issue that I think is related to this. Attached a journ=
al
file containing the traces from the last boot where it occurred. For some
reason, it doesn't happen every time I try to resume from suspend, but when=
 it
does I have no choice but to hard reboot. This is a Thinkpad E585, uname -a
&quot;Linux thonkpad 5.2.3-arch1-1-ARCH #1 SMP PREEMPT Fri Jul 26 08:13:47 =
UTC 2019
x86_64 GNU/Linux&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643619452.Ae844E.15409--

--===============0371453620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0371453620==--
