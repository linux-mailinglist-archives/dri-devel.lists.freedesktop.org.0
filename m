Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3FC36927
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 03:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A1389690;
	Thu,  6 Jun 2019 01:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC46489690
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 01:25:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C403472167; Thu,  6 Jun 2019 01:25:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110845] [DC-only][regression] cannot select full refresh rate
 on 5.2rc - 144Hz 2560x1440
Date: Thu, 06 Jun 2019 01:25:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mcoffin13@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110845-502-dJLHVao57m@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110845-502@http.bugs.freedesktop.org/>
References: <bug-110845-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0799384383=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0799384383==
Content-Type: multipart/alternative; boundary="15597843000.E6CdE6Ca6.15710"
Content-Transfer-Encoding: 7bit


--15597843000.E6CdE6Ca6.15710
Date: Thu, 6 Jun 2019 01:25:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110845

--- Comment #4 from Matt Coffin <mcoffin13@gmail.com> ---
I just tested this now on my setup with this patch on top of
amd-staging-drm-next, and all looks good! Thank you kindly.

Too bad this one was easy enough that I didn't get to do any learning. Now,=
 on
to the power management issues I see under load :).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597843000.E6CdE6Ca6.15710
Date: Thu, 6 Jun 2019 01:25:00 +0000
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
   title=3D"NEW - [DC-only][regression] cannot select full refresh rate on =
5.2rc - 144Hz 2560x1440"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110845#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [DC-only][regression] cannot select full refresh rate on =
5.2rc - 144Hz 2560x1440"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110845">bug 11084=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mcoffin13&#64;gmail.com" title=3D"Matt Coffin &lt;mcoffin13&#64;gmail.com&g=
t;"> <span class=3D"fn">Matt Coffin</span></a>
</span></b>
        <pre>I just tested this now on my setup with this patch on top of
amd-staging-drm-next, and all looks good! Thank you kindly.

Too bad this one was easy enough that I didn't get to do any learning. Now,=
 on
to the power management issues I see under load :).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597843000.E6CdE6Ca6.15710--

--===============0799384383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0799384383==--
