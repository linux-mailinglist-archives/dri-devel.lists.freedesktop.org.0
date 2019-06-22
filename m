Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68254F6C2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 18:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9A86E354;
	Sat, 22 Jun 2019 16:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E90FF6E354
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 16:11:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DE65472167; Sat, 22 Jun 2019 16:11:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110956] List of 19.20-812932 release mistakes
Date: Sat, 22 Jun 2019 16:11:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fdo-bugs@engestrom.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110956-502-T5bx1ssuI8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110956-502@http.bugs.freedesktop.org/>
References: <bug-110956-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1521843325=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1521843325==
Content-Type: multipart/alternative; boundary="15612198750.1d6Ef.18991"
Content-Transfer-Encoding: 7bit


--15612198750.1d6Ef.18991
Date: Sat, 22 Jun 2019 16:11:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110956

--- Comment #4 from Eric Engestrom <fdo-bugs@engestrom.ch> ---
OK, there are 4 issues left:

110965 & 110964 are about the docs on https://amdgpu-install.readthedocs.io=
/; a
quick look at the repo shows only one member, Tim Writer
(https://gitlab.com/amdgpu/docs/amdgpu-install/-/project_members).
You should try to contact him about these, or maybe simply send him an MR w=
ith
your updates.
I'll close these two now.

110958 is about the docs on the AMD.com website, which we have no control o=
ver,
but there are some AMD devs that read the bug tracker; maybe they'll see th=
is
bug and know how to update the docs.

Lastly, 110966 is about the Vulkan SDK from LunarG; I don't know much about=
 it
other than the fact it is used on Windows to distribute the vulkan loader (=
the
thing that manages the various vendors' vulkan drivers).
As for the api version numbers, 1.1.x should be all compatible with one
another, aside from missing features from newer releases, obviously.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15612198750.1d6Ef.18991
Date: Sat, 22 Jun 2019 16:11:15 +0000
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
   title=3D"NEW - List of 19.20-812932 release mistakes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110956#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - List of 19.20-812932 release mistakes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110956">bug 11095=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fdo-bugs&#64;engestrom.ch" title=3D"Eric Engestrom &lt;fdo-bugs&#64;engestr=
om.ch&gt;"> <span class=3D"fn">Eric Engestrom</span></a>
</span></b>
        <pre>OK, there are 4 issues left:

110965 &amp; 110964 are about the docs on <a href=3D"https://amdgpu-install=
.readthedocs.io/">https://amdgpu-install.readthedocs.io/</a>; a
quick look at the repo shows only one member, Tim Writer
(<a href=3D"https://gitlab.com/amdgpu/docs/amdgpu-install/-/project_members=
">https://gitlab.com/amdgpu/docs/amdgpu-install/-/project_members</a>).
You should try to contact him about these, or maybe simply send him an MR w=
ith
your updates.
I'll close these two now.

110958 is about the docs on the AMD.com website, which we have no control o=
ver,
but there are some AMD devs that read the bug tracker; maybe they'll see th=
is
bug and know how to update the docs.

Lastly, 110966 is about the Vulkan SDK from LunarG; I don't know much about=
 it
other than the fact it is used on Windows to distribute the vulkan loader (=
the
thing that manages the various vendors' vulkan drivers).
As for the api version numbers, 1.1.x should be all compatible with one
another, aside from missing features from newer releases, obviously.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15612198750.1d6Ef.18991--

--===============1521843325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1521843325==--
