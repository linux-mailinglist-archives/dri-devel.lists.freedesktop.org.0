Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515544E0D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 23:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843D389307;
	Thu, 13 Jun 2019 21:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D2F389307
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 21:03:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 997A272167; Thu, 13 Jun 2019 21:03:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110856] Freesync causes in-game blackscreens when game has low
 fps.
Date: Thu, 13 Jun 2019 21:03:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: mokurai82@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110856-502-zaP24ufi8w@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110856-502@http.bugs.freedesktop.org/>
References: <bug-110856-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0248129104=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0248129104==
Content-Type: multipart/alternative; boundary="15604598141.9bbC0D.14323"
Content-Transfer-Encoding: 7bit


--15604598141.9bbC0D.14323
Date: Thu, 13 Jun 2019 21:03:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110856

--- Comment #9 from Arek Tumas <mokurai82@gmail.com> ---
Created attachment 144534
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144534&action=3Dedit
/etc/mkinitcpio.conf

I also changed this file to point to my custom edid.bin file

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604598141.9bbC0D.14323
Date: Thu, 13 Jun 2019 21:03:34 +0000
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
   title=3D"NEW - Freesync causes in-game blackscreens when game has low fp=
s."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110856#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Freesync causes in-game blackscreens when game has low fp=
s."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110856">bug 11085=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mokurai82&#64;gmail.com" title=3D"Arek Tumas &lt;mokurai82&#64;gmail.com&gt=
;"> <span class=3D"fn">Arek Tumas</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144534=
" name=3D"attach_144534" title=3D"/etc/mkinitcpio.conf">attachment 144534</=
a> <a href=3D"attachment.cgi?id=3D144534&amp;action=3Dedit" title=3D"/etc/m=
kinitcpio.conf">[details]</a></span>
/etc/mkinitcpio.conf

I also changed this file to point to my custom edid.bin file</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604598141.9bbC0D.14323--

--===============0248129104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0248129104==--
