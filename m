Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B337282FE0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 12:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840B06E358;
	Tue,  6 Aug 2019 10:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 729A66E358
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 10:45:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6AE3372167; Tue,  6 Aug 2019 10:45:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111228] PRIME output screen stays black on 1002:15d8 with 128MB
 VRAM
Date: Tue, 06 Aug 2019 10:45:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: januszekdawid@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111228-502-new3GTOcmu@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111228-502@http.bugs.freedesktop.org/>
References: <bug-111228-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0051343745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0051343745==
Content-Type: multipart/alternative; boundary="15650883252.A2fa5d81c.10885"
Content-Transfer-Encoding: 7bit


--15650883252.A2fa5d81c.10885
Date: Tue, 6 Aug 2019 10:45:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111228

--- Comment #6 from djczaps <januszekdawid@gmail.com> ---
Similar situation --> if not exactly the same. Except I don't need to do any
nvidia-blacklist as a backup. Nvidia is just blacklisted itself. Also stran=
ge
power management when You pres the switch off button most often the system
doesn't shutdown. Need to press the power button manually to make it happen.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15650883252.A2fa5d81c.10885
Date: Tue, 6 Aug 2019 10:45:25 +0000
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
   title=3D"NEW - PRIME output screen stays black on 1002:15d8 with 128MB V=
RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111228#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PRIME output screen stays black on 1002:15d8 with 128MB V=
RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111228">bug 11122=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
januszekdawid&#64;gmail.com" title=3D"djczaps &lt;januszekdawid&#64;gmail.c=
om&gt;"> <span class=3D"fn">djczaps</span></a>
</span></b>
        <pre>Similar situation --&gt; if not exactly the same. Except I don=
't need to do any
nvidia-blacklist as a backup. Nvidia is just blacklisted itself. Also stran=
ge
power management when You pres the switch off button most often the system
doesn't shutdown. Need to press the power button manually to make it happen=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15650883252.A2fa5d81c.10885--

--===============0051343745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0051343745==--
