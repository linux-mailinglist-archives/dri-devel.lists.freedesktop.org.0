Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C1CC301
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 20:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA2B6EC1B;
	Fri,  4 Oct 2019 18:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A0DF6EC1B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 18:53:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 06D3072162; Fri,  4 Oct 2019 18:53:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel: [drm] psp command failed and
 response status is (-65529) at 27th time of S3. 28th time of S3 freeze the
 system.
Date: Fri, 04 Oct 2019 18:53:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrey.grodzovsky@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110886-502-7oKqsW3bYa@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110886-502@http.bugs.freedesktop.org/>
References: <bug-110886-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0869237757=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0869237757==
Content-Type: multipart/alternative; boundary="15702151964.1579eDa.23601"
Content-Transfer-Encoding: 7bit


--15702151964.1579eDa.23601
Date: Fri, 4 Oct 2019 18:53:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

--- Comment #24 from Andrey Grodzovsky <andrey.grodzovsky@amd.com> ---
(In reply to Kai-Heng Feng from comment #23)
> Created attachment 145576 [details]
> journalctl last boot kernel message

Can u retry with latest FW from
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

and also load kernel with drm.debug=3D1 as there seems  a failure in PSP co=
mmand
submission during FW loading but the actual code of failure is now under de=
bug
log level.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15702151964.1579eDa.23601
Date: Fri, 4 Oct 2019 18:53:16 +0000
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
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">bug 11088=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrey.grodzovsky&#64;amd.com" title=3D"Andrey Grodzovsky &lt;andrey.grodzo=
vsky&#64;amd.com&gt;"> <span class=3D"fn">Andrey Grodzovsky</span></a>
</span></b>
        <pre>(In reply to Kai-Heng Feng from <a href=3D"show_bug.cgi?id=3D1=
10886#c23">comment #23</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145576" name=3D"attach_145576" title=3D"journalctl last boot kernel=
 message">attachment 145576</a> <a href=3D"attachment.cgi?id=3D145576&amp;a=
ction=3Dedit" title=3D"journalctl last boot kernel message">[details]</a></=
span>
&gt; journalctl last boot kernel message</span >

Can u retry with latest FW from
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git">https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux=
-firmware.git</a>

and also load kernel with drm.debug=3D1 as there seems  a failure in PSP co=
mmand
submission during FW loading but the actual code of failure is now under de=
bug
log level.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15702151964.1579eDa.23601--

--===============0869237757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0869237757==--
