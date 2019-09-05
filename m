Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAEAAAF20
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 01:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3666E0DF;
	Thu,  5 Sep 2019 23:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E84946E0DF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 23:34:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E45CC72161; Thu,  5 Sep 2019 23:34:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111555] [amdgpu/Navi] [powerplay] Failed to send message errors
Date: Thu, 05 Sep 2019 23:34:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111555-502-y3LqSk0inJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111555-502@http.bugs.freedesktop.org/>
References: <bug-111555-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1940683168=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1940683168==
Content-Type: multipart/alternative; boundary="15677264581.2Ad2.24009"
Content-Transfer-Encoding: 7bit


--15677264581.2Ad2.24009
Date: Thu, 5 Sep 2019 23:34:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111555

--- Comment #1 from Shmerl <shtetldik@gmail.com> ---
These errors also happen when using radeon-profile to control the fan speed:

[ 3099.422315] amdgpu: [powerplay] Failed to send message 0xe, response
0xfffffffb param 0x80
[ 3099.422318] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 3145.423048] amdgpu: [powerplay] Failed to send message 0x12, response
0xfffffffb param 0x6
[ 3145.423051] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 3145.423076] amdgpu: [powerplay] Failed to send message 0x12, response
0xfffffffb, param 0x6
[ 3149.423073] amdgpu: [powerplay] Failed to send message 0x12, response
0xfffffffb param 0x6
[ 3149.423076] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 3200.422744] amdgpu: [powerplay] Failed to send message 0xf, response
0xfffffffb, param 0xa90000
[ 3200.422846] amdgpu: [powerplay] Failed to send message 0x12, response
0xfffffffb param 0x6
[ 3200.422850] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 3234.422189] amdgpu: [powerplay] Failed to send message 0xf, response
0xfffffffb, param 0xa90000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15677264581.2Ad2.24009
Date: Thu, 5 Sep 2019 23:34:18 +0000
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
   title=3D"NEW - [amdgpu/Navi] [powerplay] Failed to send message errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111555#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu/Navi] [powerplay] Failed to send message errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111555">bug 11155=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>These errors also happen when using radeon-profile to control =
the fan speed:

[ 3099.422315] amdgpu: [powerplay] Failed to send message 0xe, response
0xfffffffb param 0x80
[ 3099.422318] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 3145.423048] amdgpu: [powerplay] Failed to send message 0x12, response
0xfffffffb param 0x6
[ 3145.423051] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 3145.423076] amdgpu: [powerplay] Failed to send message 0x12, response
0xfffffffb, param 0x6
[ 3149.423073] amdgpu: [powerplay] Failed to send message 0x12, response
0xfffffffb param 0x6
[ 3149.423076] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 3200.422744] amdgpu: [powerplay] Failed to send message 0xf, response
0xfffffffb, param 0xa90000
[ 3200.422846] amdgpu: [powerplay] Failed to send message 0x12, response
0xfffffffb param 0x6
[ 3200.422850] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 3234.422189] amdgpu: [powerplay] Failed to send message 0xf, response
0xfffffffb, param 0xa90000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15677264581.2Ad2.24009--

--===============1940683168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1940683168==--
