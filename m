Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F56F18E8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 15:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5C16ED90;
	Wed,  6 Nov 2019 14:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C244A6ED90
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 14:40:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B45B6720E2; Wed,  6 Nov 2019 14:40:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112214] Vega20 crashing randomly while using Xorg or Wayland in
 Fedora 31
Date: Wed, 06 Nov 2019 14:40:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: renich@woralelandia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-112214-502-jPcmPVF7MT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112214-502@http.bugs.freedesktop.org/>
References: <bug-112214-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0203489969=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0203489969==
Content-Type: multipart/alternative; boundary="15730512050.ffcb6C29.25629"
Content-Transfer-Encoding: 7bit


--15730512050.ffcb6C29.25629
Date: Wed, 6 Nov 2019 14:40:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112214

--- Comment #4 from renich@woralelandia.com <renich@woralelandia.com> ---
Created attachment 145902
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145902&action=3Dedit
dmesg from latest boot

Of course.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15730512050.ffcb6C29.25629
Date: Wed, 6 Nov 2019 14:40:05 +0000
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
   title=3D"NEW - Vega20 crashing randomly while using Xorg or Wayland in F=
edora 31"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112214#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Vega20 crashing randomly while using Xorg or Wayland in F=
edora 31"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112214">bug 11221=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
renich&#64;woralelandia.com" title=3D"renich&#64;woralelandia.com &lt;renic=
h&#64;woralelandia.com&gt;"> <span class=3D"fn">renich&#64;woralelandia.com=
</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145902=
" name=3D"attach_145902" title=3D"dmesg from latest boot">attachment 145902=
</a> <a href=3D"attachment.cgi?id=3D145902&amp;action=3Dedit" title=3D"dmes=
g from latest boot">[details]</a></span>
dmesg from latest boot

Of course.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15730512050.ffcb6C29.25629--

--===============0203489969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0203489969==--
