Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D433FBA283
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF5D6E903;
	Sun, 22 Sep 2019 12:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50BD86E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 16:40:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4E4E872162; Sat, 21 Sep 2019 16:40:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sat, 21 Sep 2019 16:40:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: saldorin@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-pcB6DNt6tR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0600978299=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0600978299==
Content-Type: multipart/alternative; boundary="15690840164.AfCa614.23247"
Content-Transfer-Encoding: 7bit


--15690840164.AfCa614.23247
Date: Sat, 21 Sep 2019 16:40:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #58 from Matthias M=C3=BCller <saldorin@web.de> ---
(In reply to Doug Ty from comment #54)
> I've also been getting this, albeit very rarely. It doesn't seem to happen
> with older firmware (ie. Jul 14th firmware extracted from Fedora's
> linux-firmware package), only the newer firmware from the
> ~agd5f/radeon_ucode repo causes this.

>=20
> Perhaps this is a different issue, and if so, perhaps we should make a
> separate bug report for it?

it only happend twice for me now - but you are right, it started after the =
last
update of the firmware - i can't find the old one and it is hard to test :/

Don't know where to report as the navi-firmware is not in the kernel-firmwa=
re,
yet?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15690840164.AfCa614.23247
Date: Sat, 21 Sep 2019 16:40:16 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c58">Comme=
nt # 58</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
saldorin&#64;web.de" title=3D"Matthias M=C3=BCller &lt;saldorin&#64;web.de&=
gt;"> <span class=3D"fn">Matthias M=C3=BCller</span></a>
</span></b>
        <pre>(In reply to Doug Ty from <a href=3D"show_bug.cgi?id=3D111481#=
c54">comment #54</a>)
<span class=3D"quote">&gt; I've also been getting this, albeit very rarely.=
 It doesn't seem to happen
&gt; with older firmware (ie. Jul 14th firmware extracted from Fedora's
&gt; linux-firmware package), only the newer firmware from the
&gt; ~agd5f/radeon_ucode repo causes this.</span >

<span class=3D"quote">&gt;=20
&gt; Perhaps this is a different issue, and if so, perhaps we should make a
&gt; separate bug report for it?</span >

it only happend twice for me now - but you are right, it started after the =
last
update of the firmware - i can't find the old one and it is hard to test :/

Don't know where to report as the navi-firmware is not in the kernel-firmwa=
re,
yet?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15690840164.AfCa614.23247--

--===============0600978299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0600978299==--
