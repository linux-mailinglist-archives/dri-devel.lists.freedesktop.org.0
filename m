Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4386109D71
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 13:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FB789CF6;
	Tue, 26 Nov 2019 12:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E01C56E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 12:03:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DD3F4720E2; Tue, 26 Nov 2019 12:03:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Tue, 26 Nov 2019 12:03:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: linedot@xcpp.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110674-502-i7ws3Em0j6@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1688969742=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1688969742==
Content-Type: multipart/alternative; boundary="157476978110.90E12.32344"
Content-Transfer-Encoding: 7bit


--157476978110.90E12.32344
Date: Tue, 26 Nov 2019 12:03:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #171 from linedot@xcpp.org ---
Created attachment 146026
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D146026&action=3Dedit
5.4.0-arch1-1 GPU initialization fails

With kernel version 5.4.0-arch1-1 the GPU can flat out no longer be
initialized.

My system is now completely unusable with the current kernel.

Does this specifically mean anything?
[   15.575361] amdgpu: [powerplay] smu driver if version =3D 0x00000013, sm=
u fw
if version =3D 0x00000012, smu fw version =3D 0x00282d00 (40.45.0)
[   15.575362] amdgpu: [powerplay] SMU driver if version not matched

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157476978110.90E12.32344
Date: Tue, 26 Nov 2019 12:03:01 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c171">Comm=
ent # 171</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
linedot&#64;xcpp.org" title=3D"linedot&#64;xcpp.org">linedot&#64;xcpp.org</=
a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D146026=
" name=3D"attach_146026" title=3D"5.4.0-arch1-1 GPU initialization fails">a=
ttachment 146026</a> <a href=3D"attachment.cgi?id=3D146026&amp;action=3Dedi=
t" title=3D"5.4.0-arch1-1 GPU initialization fails">[details]</a></span>
5.4.0-arch1-1 GPU initialization fails

With kernel version 5.4.0-arch1-1 the GPU can flat out no longer be
initialized.

My system is now completely unusable with the current kernel.

Does this specifically mean anything?
[   15.575361] amdgpu: [powerplay] smu driver if version =3D 0x00000013, sm=
u fw
if version =3D 0x00000012, smu fw version =3D 0x00282d00 (40.45.0)
[   15.575362] amdgpu: [powerplay] SMU driver if version not matched</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157476978110.90E12.32344--

--===============1688969742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1688969742==--
