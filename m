Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B9D17A2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 20:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8F76EA38;
	Wed,  9 Oct 2019 18:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id ADAC76EA36
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 18:39:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AAD0572162; Wed,  9 Oct 2019 18:39:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111913] AMD Navi10 GPU powerplay issues when using two
 DisplayPort connectors
Date: Wed, 09 Oct 2019 18:39:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan@rehm.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111913-502-EP8tjPyyUU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111913-502@http.bugs.freedesktop.org/>
References: <bug-111913-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0602406390=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0602406390==
Content-Type: multipart/alternative; boundary="15706463940.6eCFca6.14525"
Content-Transfer-Encoding: 7bit


--15706463940.6eCFca6.14525
Date: Wed, 9 Oct 2019 18:39:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111913

--- Comment #10 from Stefan Rehm <stefan@rehm.email> ---
Correction: the exact frequency reported by xrandr is 59.95

I took Andrew Sheldon`s advice and experimented a bit with refresh rates and
resolutions. Turns out, that the problem does not occur in lower resolutions
even when both displays operate at 60 Hz.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15706463940.6eCFca6.14525
Date: Wed, 9 Oct 2019 18:39:54 +0000
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
   title=3D"NEW - AMD Navi10 GPU powerplay issues when using two DisplayPor=
t connectors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111913#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi10 GPU powerplay issues when using two DisplayPor=
t connectors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111913">bug 11191=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stefan&#64;rehm.email" title=3D"Stefan Rehm &lt;stefan&#64;rehm.email&gt;">=
 <span class=3D"fn">Stefan Rehm</span></a>
</span></b>
        <pre>Correction: the exact frequency reported by xrandr is 59.95

I took Andrew Sheldon`s advice and experimented a bit with refresh rates and
resolutions. Turns out, that the problem does not occur in lower resolutions
even when both displays operate at 60 Hz.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15706463940.6eCFca6.14525--

--===============0602406390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0602406390==--
