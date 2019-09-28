Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCB2C1079
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 11:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7AE6E10A;
	Sat, 28 Sep 2019 09:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 925066E10A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 09:39:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8F51272162; Sat, 28 Sep 2019 09:39:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111691] inconsistent cursor movement speed when using AMD 5700 XT
Date: Sat, 28 Sep 2019 09:39:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: a@bailtree.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111691-502-wgBK7DaZPC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111691-502@http.bugs.freedesktop.org/>
References: <bug-111691-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0351519025=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0351519025==
Content-Type: multipart/alternative; boundary="15696635590.BCfC07ec8.32707"
Content-Transfer-Encoding: 7bit


--15696635590.BCfC07ec8.32707
Date: Sat, 28 Sep 2019 09:39:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111691

--- Comment #14 from Michael Haworth <a@bailtree.co.uk> ---
Created attachment 145575
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145575&action=3Dedit
xorg log on xubuntu 19.10 (where bug is not present)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696635590.BCfC07ec8.32707
Date: Sat, 28 Sep 2019 09:39:19 +0000
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
   title=3D"NEW - inconsistent cursor movement speed when using AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - inconsistent cursor movement speed when using AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691">bug 11169=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
a&#64;bailtree.co.uk" title=3D"Michael Haworth &lt;a&#64;bailtree.co.uk&gt;=
"> <span class=3D"fn">Michael Haworth</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145575=
" name=3D"attach_145575" title=3D"xorg log on xubuntu 19.10 (where bug is n=
ot present)">attachment 145575</a> <a href=3D"attachment.cgi?id=3D145575&am=
p;action=3Dedit" title=3D"xorg log on xubuntu 19.10 (where bug is not prese=
nt)">[details]</a></span>
xorg log on xubuntu 19.10 (where bug is not present)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696635590.BCfC07ec8.32707--

--===============0351519025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0351519025==--
