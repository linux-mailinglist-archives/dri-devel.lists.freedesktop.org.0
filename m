Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCC7B4BC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 23:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BB06E616;
	Tue, 30 Jul 2019 21:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69B716E619
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 21:04:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6649772168; Tue, 30 Jul 2019 21:04:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110575] [R9 380X] Artifacts in CSGO
Date: Tue, 30 Jul 2019 21:04:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110575-502-UInbthJkWP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110575-502@http.bugs.freedesktop.org/>
References: <bug-110575-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1793972508=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1793972508==
Content-Type: multipart/alternative; boundary="15645206901.D7C0.22890"
Content-Transfer-Encoding: 7bit


--15645206901.D7C0.22890
Date: Tue, 30 Jul 2019 21:04:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110575

--- Comment #8 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
On Tue, Jul 30, 2019 at 08:54:44PM +0000, bugzilla-daemon@freedesktop.org
wrote:
> I plan to disable SDMA image copies by default on dGPUs.

Is there a plan to "standardize" tiling format of frame buffer?
(to dma the right format properly from one brand of gpus to another)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645206901.D7C0.22890
Date: Tue, 30 Jul 2019 21:04:50 +0000
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
   title=3D"NEW - [R9 380X] Artifacts in CSGO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110575#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [R9 380X] Artifacts in CSGO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110575">bug 11057=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>On Tue, Jul 30, 2019 at 08:54:44PM +0000, <a href=3D"mailto:bu=
gzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>
wrote:
<span class=3D"quote">&gt; I plan to disable SDMA image copies by default o=
n dGPUs.</span >

Is there a plan to &quot;standardize&quot; tiling format of frame buffer?
(to dma the right format properly from one brand of gpus to another)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645206901.D7C0.22890--

--===============1793972508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1793972508==--
