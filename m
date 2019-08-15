Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223D48F43A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 21:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423F36E11B;
	Thu, 15 Aug 2019 19:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAABD6EA58
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 19:15:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E74EC7215A; Thu, 15 Aug 2019 19:15:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Thu, 15 Aug 2019 19:15:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wiktoraleksanderkaczor@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111122-502-l4dUovtwLU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111122-502@http.bugs.freedesktop.org/>
References: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0277095837=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0277095837==
Content-Type: multipart/alternative; boundary="15658965208.d40d27B.14161"
Content-Transfer-Encoding: 7bit


--15658965208.d40d27B.14161
Date: Thu, 15 Aug 2019 19:15:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #18 from Wiktor Kaczor <wiktoraleksanderkaczor@gmail.com> ---
So, I've installed Compton as an alternative compositor on XFCE4 (I disabled
the internal one), it works rather well The only problem I could find so fa=
r is
that the graphics corruption persists when moving windows (the white blocky
stuff that appears around all moving elements). Although, It does clear up =
as
soon as I stop moving the window.

Alternatively, I was thinking of moving to using Wayland, however, XFCE4
doesn't seem to support it so that's not an option for me. Perhaps someone =
can
test that on their own system. Anyhow, I'm happy with the functionality of =
my
current albeit partial solution. I will continue to check in for a full
solution though.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15658965208.d40d27B.14161
Date: Thu, 15 Aug 2019 19:15:20 +0000
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
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wiktoraleksanderkaczor&#64;gmail.com" title=3D"Wiktor Kaczor &lt;wiktoralek=
sanderkaczor&#64;gmail.com&gt;"> <span class=3D"fn">Wiktor Kaczor</span></a>
</span></b>
        <pre>So, I've installed Compton as an alternative compositor on XFC=
E4 (I disabled
the internal one), it works rather well The only problem I could find so fa=
r is
that the graphics corruption persists when moving windows (the white blocky
stuff that appears around all moving elements). Although, It does clear up =
as
soon as I stop moving the window.

Alternatively, I was thinking of moving to using Wayland, however, XFCE4
doesn't seem to support it so that's not an option for me. Perhaps someone =
can
test that on their own system. Anyhow, I'm happy with the functionality of =
my
current albeit partial solution. I will continue to check in for a full
solution though.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15658965208.d40d27B.14161--

--===============0277095837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0277095837==--
