Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC4EBBAF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 02:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA2D6E11D;
	Fri,  1 Nov 2019 01:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AEE56F6AD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 01:27:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 77D24720E2; Fri,  1 Nov 2019 01:27:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111869] Navi "divide error" hang
Date: Fri, 01 Nov 2019 01:27:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111869-502-2L9rkrhvJ6@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111869-502@http.bugs.freedesktop.org/>
References: <bug-111869-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0072562239=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0072562239==
Content-Type: multipart/alternative; boundary="15725716603.1aAD7d.26231"
Content-Transfer-Encoding: 7bit


--15725716603.1aAD7d.26231
Date: Fri, 1 Nov 2019 01:27:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111869

--- Comment #3 from Andrew Sheldon <asheldon55@gmail.com> ---
I also get this error frequently with amd-staging-drm-next, but not with
5.4-rcX (at least I can't remember getting one with the latter).

Not sure if that suggests there is a regression, or something to do with the
5.3 kernel specifically (I don't remember having the error when
amd-staging-drm-next was using 5.2 kernel).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725716603.1aAD7d.26231
Date: Fri, 1 Nov 2019 01:27:40 +0000
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
   title=3D"NEW - Navi &quot;divide error&quot; hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111869#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi &quot;divide error&quot; hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111869">bug 11186=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>I also get this error frequently with amd-staging-drm-next, bu=
t not with
5.4-rcX (at least I can't remember getting one with the latter).

Not sure if that suggests there is a regression, or something to do with the
5.3 kernel specifically (I don't remember having the error when
amd-staging-drm-next was using 5.2 kernel).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725716603.1aAD7d.26231--

--===============0072562239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0072562239==--
