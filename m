Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA44923B4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 14:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9410E89F61;
	Mon, 19 Aug 2019 12:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 174336E111
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 12:44:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1468572161; Mon, 19 Aug 2019 12:44:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105651] Vega64 doesn't output properly onto dell up2715k at
 5120x2880
Date: Mon, 19 Aug 2019 12:44:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@redsandro.e4ward.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105651-502-HkyCJxT3Ki@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105651-502@http.bugs.freedesktop.org/>
References: <bug-105651-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0221197923=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0221197923==
Content-Type: multipart/alternative; boundary="15662186510.33FFDfD.7873"
Content-Transfer-Encoding: 7bit


--15662186510.33FFDfD.7873
Date: Mon, 19 Aug 2019 12:44:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105651

--- Comment #6 from Redsandro <freedesktop@redsandro.e4ward.com> ---
I'm having the same issue with a 4K Dell UP2414Q with 3840x2160 as
1920x2160+0+0, 1920x2160 +1920+0.

Is it possible to do a workaround in xorg.conf, similar to nVidia's TwinView
and nvidiaXineramaInfoOrder as described in this question?

https://unix.stackexchange.com/questions/536175/how-do-i-tile-two-displays-=
onto-one-monitor-with-amd-graphics

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662186510.33FFDfD.7873
Date: Mon, 19 Aug 2019 12:44:11 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Vega64 doesn't output properly onto dell up2715k at =
5120x2880"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105651#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Vega64 doesn't output properly onto dell up2715k at =
5120x2880"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105651">bug 10565=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;redsandro.e4ward.com" title=3D"Redsandro &lt;freedesktop&#6=
4;redsandro.e4ward.com&gt;"> <span class=3D"fn">Redsandro</span></a>
</span></b>
        <pre>I'm having the same issue with a 4K Dell UP2414Q with 3840x216=
0 as
1920x2160+0+0, 1920x2160 +1920+0.

Is it possible to do a workaround in xorg.conf, similar to nVidia's TwinView
and nvidiaXineramaInfoOrder as described in this question?

<a href=3D"https://unix.stackexchange.com/questions/536175/how-do-i-tile-tw=
o-displays-onto-one-monitor-with-amd-graphics">https://unix.stackexchange.c=
om/questions/536175/how-do-i-tile-two-displays-onto-one-monitor-with-amd-gr=
aphics</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662186510.33FFDfD.7873--

--===============0221197923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0221197923==--
