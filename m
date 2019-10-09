Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB18D187A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 21:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EAA6EA44;
	Wed,  9 Oct 2019 19:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AA036EA44
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 19:14:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7754072162; Wed,  9 Oct 2019 19:14:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111555] [amdgpu/Navi] [powerplay] Failed to send message errors
Date: Wed, 09 Oct 2019 19:14:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@tako.mx
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111555-502-7jZwieuIHE@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0965216554=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0965216554==
Content-Type: multipart/alternative; boundary="15706484780.51F56fC.22240"
Content-Transfer-Encoding: 7bit


--15706484780.51F56fC.22240
Date: Wed, 9 Oct 2019 19:14:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111555

--- Comment #7 from Tako Marks <me@tako.mx> ---
I ran into this issue when messing around with my BIOS settings. Not sure if
helpful but when I had the option Decode Above 4G (64bit adressing on PCI b=
us?)
on my Gigabyte Aorus B450 I experienced the same issue. After turning that
option back off everything is working again.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15706484780.51F56fC.22240
Date: Wed, 9 Oct 2019 19:14:38 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111555#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu/Navi] [powerplay] Failed to send message errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111555">bug 11155=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;tako.mx" title=3D"Tako Marks &lt;me&#64;tako.mx&gt;"> <span class=3D=
"fn">Tako Marks</span></a>
</span></b>
        <pre>I ran into this issue when messing around with my BIOS setting=
s. Not sure if
helpful but when I had the option Decode Above 4G (64bit adressing on PCI b=
us?)
on my Gigabyte Aorus B450 I experienced the same issue. After turning that
option back off everything is working again.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15706484780.51F56fC.22240--

--===============0965216554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0965216554==--
