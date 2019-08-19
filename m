Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2591F62
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 10:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336416E0E6;
	Mon, 19 Aug 2019 08:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C3D96E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 08:52:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 48F1C72161; Mon, 19 Aug 2019 08:52:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel:
 [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
 [CRTC:57:crtc-0] flip_done timed out
Date: Mon, 19 Aug 2019 08:52:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kai.heng.feng@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110886-502-pEGOyaAcBJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110886-502@http.bugs.freedesktop.org/>
References: <bug-110886-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0071582471=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0071582471==
Content-Type: multipart/alternative; boundary="15662047503.dC52A2E.30147"
Content-Transfer-Encoding: 7bit


--15662047503.dC52A2E.30147
Date: Mon, 19 Aug 2019 08:52:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

--- Comment #16 from Kai-Heng Feng <kai.heng.feng@canonical.com> ---
(In reply to Samantha McVey from comment #13)
> Created attachment 145085 [details]
> amd-staging-drm-net dmesg log

Doesn't look like the same one.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662047503.dC52A2E.30147
Date: Mon, 19 Aug 2019 08:52:30 +0000
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
   title=3D"NEW - After S3 resume, kernel: [drm:drm_atomic_helper_wait_for_=
flip_done [drm_kms_helper]] *ERROR* [CRTC:57:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm:drm_atomic_helper_wait_for_=
flip_done [drm_kms_helper]] *ERROR* [CRTC:57:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">bug 11088=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kai.heng.feng&#64;canonical.com" title=3D"Kai-Heng Feng &lt;kai.heng.feng&#=
64;canonical.com&gt;"> <span class=3D"fn">Kai-Heng Feng</span></a>
</span></b>
        <pre>(In reply to Samantha McVey from <a href=3D"show_bug.cgi?id=3D=
110886#c13">comment #13</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145085" name=3D"attach_145085" title=3D"amd-staging-drm-net dmesg l=
og">attachment 145085</a> <a href=3D"attachment.cgi?id=3D145085&amp;action=
=3Dedit" title=3D"amd-staging-drm-net dmesg log">[details]</a></span>
&gt; amd-staging-drm-net dmesg log</span >

Doesn't look like the same one.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662047503.dC52A2E.30147--

--===============0071582471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0071582471==--
