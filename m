Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00816B5FCA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 11:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC296EE69;
	Wed, 18 Sep 2019 09:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07B5F6EE69
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 09:05:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F1EB072167; Wed, 18 Sep 2019 09:05:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111730] Xorg does not render with mesa 19.1.7
Date: Wed, 18 Sep 2019 09:05:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/i915
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: edoars@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111730-502-71r1odUHQp@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111730-502@http.bugs.freedesktop.org/>
References: <bug-111730-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1810851944=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1810851944==
Content-Type: multipart/alternative; boundary="15687975490.BC1b3A70.29355"
Content-Transfer-Encoding: 7bit


--15687975490.BC1b3A70.29355
Date: Wed, 18 Sep 2019 09:05:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111730

--- Comment #5 from Edoardo Signorini <edoars@gmail.com> ---
(In reply to Lionel Landwerlin from comment #4)
> Could you us more details about your setup?
>=20
> I assume you're not just running bare X11 with no window manager/composit=
or?

I'm running bspwm with compton. I didn't try to switch to another window
manager but running without a compositor shows even more artifacts

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687975490.BC1b3A70.29355
Date: Wed, 18 Sep 2019 09:05:49 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Xorg does not render with mesa 19.1.7"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111730#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Xorg does not render with mesa 19.1.7"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111730">bug 11173=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
edoars&#64;gmail.com" title=3D"Edoardo Signorini &lt;edoars&#64;gmail.com&g=
t;"> <span class=3D"fn">Edoardo Signorini</span></a>
</span></b>
        <pre>(In reply to Lionel Landwerlin from <a href=3D"show_bug.cgi?id=
=3D111730#c4">comment #4</a>)
<span class=3D"quote">&gt; Could you us more details about your setup?
&gt;=20
&gt; I assume you're not just running bare X11 with no window manager/compo=
sitor?</span >

I'm running bspwm with compton. I didn't try to switch to another window
manager but running without a compositor shows even more artifacts</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687975490.BC1b3A70.29355--

--===============1810851944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1810851944==--
