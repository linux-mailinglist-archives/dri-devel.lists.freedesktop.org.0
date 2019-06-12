Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251884314F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 23:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DA989267;
	Wed, 12 Jun 2019 21:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F52789267
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 21:04:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9C2BE72167; Wed, 12 Jun 2019 21:04:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Wed, 12 Jun 2019 21:04:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cosiekvfj@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110897-502-kKDXRrt0dW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0651484161=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0651484161==
Content-Type: multipart/alternative; boundary="15603734701.13EB0c7Fa.24049"
Content-Transfer-Encoding: 7bit


--15603734701.13EB0c7Fa.24049
Date: Wed, 12 Jun 2019 21:04:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #14 from cosiekvfj@o2.pl ---
Created attachment 144524
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144524&action=3Dedit
bigger glxgears window

>Is HyperZ just good without any changes to stock mesa?
yes, mesa is from manjaro repo, and I think that it's the same build as in =
arch
repo.

>Your card seems to be also reported as RC410 like mine, but you have much-=
much more FPS for some reason.
It's because window size of glxgears ;) We could test that if you want. But=
 we
need to agree on window size ;)

>Is this also a laptop?
Yes.

I also tried to resize window to try to get some artifacts. Apart from some
flickering during resizing, image was good. Flickering was also present wit=
hout
HyperZ.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603734701.13EB0c7Fa.24049
Date: Wed, 12 Jun 2019 21:04:30 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cosiekvfj&#64;o2.pl" title=3D"cosiekvfj&#64;o2.pl">cosiekvfj&#64;o2.pl</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144524=
" name=3D"attach_144524" title=3D"bigger glxgears window">attachment 144524=
</a> <a href=3D"attachment.cgi?id=3D144524&amp;action=3Dedit" title=3D"bigg=
er glxgears window">[details]</a></span>
bigger glxgears window

<span class=3D"quote">&gt;Is HyperZ just good without any changes to stock =
mesa?</span >
yes, mesa is from manjaro repo, and I think that it's the same build as in =
arch
repo.

<span class=3D"quote">&gt;Your card seems to be also reported as RC410 like=
 mine, but you have much-much more FPS for some reason.</span >
It's because window size of glxgears ;) We could test that if you want. But=
 we
need to agree on window size ;)

<span class=3D"quote">&gt;Is this also a laptop?</span >
Yes.

I also tried to resize window to try to get some artifacts. Apart from some
flickering during resizing, image was good. Flickering was also present wit=
hout
HyperZ.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603734701.13EB0c7Fa.24049--

--===============0651484161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0651484161==--
