Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F617C4DD
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 16:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E670489EB4;
	Wed, 31 Jul 2019 14:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1EB689EB4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 14:25:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E7CB572168; Wed, 31 Jul 2019 14:25:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110188] AMD graphics card driver cannot be installed on Fedora 29
Date: Wed, 31 Jul 2019 14:25:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jeremy.Newton@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110188-502-wpspedFYhx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110188-502@http.bugs.freedesktop.org/>
References: <bug-110188-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0085558511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0085558511==
Content-Type: multipart/alternative; boundary="15645831031.E5B7eEF9.6665"
Content-Transfer-Encoding: 7bit


--15645831031.E5B7eEF9.6665
Date: Wed, 31 Jul 2019 14:25:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110188

--- Comment #2 from Jeremy Newton <Jeremy.Newton@amd.com> ---
I don't think I understand the issue. Fedora 29 is not supported by our dri=
ver.

With that said, Fedora should have support for RX480 through the distro.

Do you need something specific from our PRO driver? We recommend using the
distro drivers for Fedora.

Which version of the driver are you using? I can try to reproduce the issue
you're having with RHEL 7.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645831031.E5B7eEF9.6665
Date: Wed, 31 Jul 2019 14:25:03 +0000
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
   title=3D"NEW - AMD graphics card driver cannot be installed on Fedora 29"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110188#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD graphics card driver cannot be installed on Fedora 29"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110188">bug 11018=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Jeremy.Newton&#64;amd.com" title=3D"Jeremy Newton &lt;Jeremy.Newton&#64;amd=
.com&gt;"> <span class=3D"fn">Jeremy Newton</span></a>
</span></b>
        <pre>I don't think I understand the issue. Fedora 29 is not support=
ed by our driver.

With that said, Fedora should have support for RX480 through the distro.

Do you need something specific from our PRO driver? We recommend using the
distro drivers for Fedora.

Which version of the driver are you using? I can try to reproduce the issue
you're having with RHEL 7.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645831031.E5B7eEF9.6665--

--===============0085558511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0085558511==--
