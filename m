Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A885D1A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 10:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3226E6C3;
	Thu,  8 Aug 2019 08:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8367A6E76F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 08:43:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7FC3472167; Thu,  8 Aug 2019 08:43:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Thu, 08 Aug 2019 08:43:58 +0000
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
Message-ID: <bug-111122-502-pV897RiZNL@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1753091141=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1753091141==
Content-Type: multipart/alternative; boundary="15652538382.bbb5.26366"
Content-Transfer-Encoding: 7bit


--15652538382.bbb5.26366
Date: Thu, 8 Aug 2019 08:43:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #7 from Wiktor Kaczor <wiktoraleksanderkaczor@gmail.com> ---
I have the same problem using the Lenovo 530S-14ARR with Ryzen 5 2500U.=20

The XFCE4 compositing makes the system immediately freeze as soon as I log =
in
on Manjaro with the 5.2.4-1 kernel.

On the 5.3rc2 kernel, I can enable it and it doesn't immediately hang witho=
ut
recovery. That said, the compositing doesn't work and we have a lot of
corruption as soon as anything updates on screen.

The "iommu=3Dpt" option didn't do anything for me in regards to reducing the
corruption.

I didn't know which logs to include so I didn't. Send reply with the names =
and
hopefully, approximate path of any logs to include.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15652538382.bbb5.26366
Date: Thu, 8 Aug 2019 08:43:58 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wiktoraleksanderkaczor&#64;gmail.com" title=3D"Wiktor Kaczor &lt;wiktoralek=
sanderkaczor&#64;gmail.com&gt;"> <span class=3D"fn">Wiktor Kaczor</span></a>
</span></b>
        <pre>I have the same problem using the Lenovo 530S-14ARR with Ryzen=
 5 2500U.=20

The XFCE4 compositing makes the system immediately freeze as soon as I log =
in
on Manjaro with the 5.2.4-1 kernel.

On the 5.3rc2 kernel, I can enable it and it doesn't immediately hang witho=
ut
recovery. That said, the compositing doesn't work and we have a lot of
corruption as soon as anything updates on screen.

The &quot;iommu=3Dpt&quot; option didn't do anything for me in regards to r=
educing the
corruption.

I didn't know which logs to include so I didn't. Send reply with the names =
and
hopefully, approximate path of any logs to include.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15652538382.bbb5.26366--

--===============1753091141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1753091141==--
