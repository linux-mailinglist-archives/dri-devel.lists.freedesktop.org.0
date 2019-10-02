Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF73C4553
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 03:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D4289A1E;
	Wed,  2 Oct 2019 01:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E80289A1E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 01:14:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3B92372162; Wed,  2 Oct 2019 01:14:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111879] GPU reset during hibernation
Date: Wed, 02 Oct 2019 01:14:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yshuiv7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111879-502-xwbCq2LSDy@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111879-502@http.bugs.freedesktop.org/>
References: <bug-111879-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0559424576=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0559424576==
Content-Type: multipart/alternative; boundary="15699788841.E307a.25223"
Content-Transfer-Encoding: 7bit


--15699788841.E307a.25223
Date: Wed, 2 Oct 2019 01:14:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111879

--- Comment #4 from Yuxuan Shui <yshuiv7@gmail.com> ---
(In reply to Alex Deucher from comment #3)
> Created attachment 145608 [details] [review]
> possible fix
>=20
> Does this patch fix the issue?

I hiberate/resumed with this patch a couple of times, the problem hasn't
occurred so far. Looks like this fixes the problem.

Thanks.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15699788841.E307a.25223
Date: Wed, 2 Oct 2019 01:14:44 +0000
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
   title=3D"NEW - GPU reset during hibernation"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111879#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU reset during hibernation"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111879">bug 11187=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yshuiv7&#64;gmail.com" title=3D"Yuxuan Shui &lt;yshuiv7&#64;gmail.com&gt;">=
 <span class=3D"fn">Yuxuan Shui</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
1879#c3">comment #3</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145608" name=3D"attach_145608" title=3D"possible fix">attachment 14=
5608</a> <a href=3D"attachment.cgi?id=3D145608&amp;action=3Dedit" title=3D"=
possible fix">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&a=
mp;bug=3D111879&amp;attachment=3D145608'>[review]</a> [review]
&gt; possible fix
&gt;=20
&gt; Does this patch fix the issue?</span >

I hiberate/resumed with this patch a couple of times, the problem hasn't
occurred so far. Looks like this fixes the problem.

Thanks.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15699788841.E307a.25223--

--===============0559424576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0559424576==--
