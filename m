Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA870F459
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 12:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC61891BF;
	Tue, 30 Apr 2019 10:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 256DE891BF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 10:40:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2238672155; Tue, 30 Apr 2019 10:40:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110509] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout
Date: Tue, 30 Apr 2019 10:40:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110509-502-Lmh5NIWvPB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110509-502@http.bugs.freedesktop.org/>
References: <bug-110509-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0208706578=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0208706578==
Content-Type: multipart/alternative; boundary="15566208241.bEa4E1.17676"
Content-Transfer-Encoding: 7bit


--15566208241.bEa4E1.17676
Date: Tue, 30 Apr 2019 10:40:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110509

--- Comment #10 from James.Dutton@gmail.com ---
Created attachment 144118
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144118&action=3Dedit
dmesg with drm-next-5.2-wip

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15566208241.bEa4E1.17676
Date: Tue, 30 Apr 2019 10:40:24 +0000
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
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509">bug 11050=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
James.Dutton&#64;gmail.com" title=3D"James.Dutton&#64;gmail.com">James.Dutt=
on&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144118=
" name=3D"attach_144118" title=3D"dmesg with drm-next-5.2-wip">attachment 1=
44118</a> <a href=3D"attachment.cgi?id=3D144118&amp;action=3Dedit" title=3D=
"dmesg with drm-next-5.2-wip">[details]</a></span>
dmesg with drm-next-5.2-wip</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15566208241.bEa4E1.17676--

--===============0208706578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0208706578==--
