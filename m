Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7D78D95
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 16:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B6689FC3;
	Mon, 29 Jul 2019 14:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A30089FC5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 14:16:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6722372167; Mon, 29 Jul 2019 14:16:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109456] KVM VFIO guest X hang with guest kernel > 4.15
Date: Mon, 29 Jul 2019 14:16:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: libgradev@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109456-502-n8ssYGzmDv@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109456-502@http.bugs.freedesktop.org/>
References: <bug-109456-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0185146651=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0185146651==
Content-Type: multipart/alternative; boundary="15644097951.fbcEED6.8363"
Content-Transfer-Encoding: 7bit


--15644097951.fbcEED6.8363
Date: Mon, 29 Jul 2019 14:16:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109456

--- Comment #8 from libgradev@gmail.com ---
Got back to this again recently and can confirm it's fixed in Qemu git (for
4.1) now.

Many thanks :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15644097951.fbcEED6.8363
Date: Mon, 29 Jul 2019 14:16:35 +0000
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
   title=3D"NEW - KVM VFIO guest X hang with guest kernel &gt; 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109456#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KVM VFIO guest X hang with guest kernel &gt; 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109456">bug 10945=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
libgradev&#64;gmail.com" title=3D"libgradev&#64;gmail.com">libgradev&#64;gm=
ail.com</a>
</span></b>
        <pre>Got back to this again recently and can confirm it's fixed in =
Qemu git (for
4.1) now.

Many thanks :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15644097951.fbcEED6.8363--

--===============0185146651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0185146651==--
