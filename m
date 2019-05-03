Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E6134C9
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 23:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CC289819;
	Fri,  3 May 2019 21:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9BDC89819
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 21:17:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A192D7215A; Fri,  3 May 2019 21:17:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110575] [R9 380X] Artifacts in CSGO
Date: Fri, 03 May 2019 21:17:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danylo.piliaiev@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-110575-502-UUKAg1UgBE@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1188708523=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1188708523==
Content-Type: multipart/alternative; boundary="15569182580.A78efc.20071"
Content-Transfer-Encoding: 7bit


--15569182580.A78efc.20071
Date: Fri, 3 May 2019 21:17:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110575

Danylo <danylo.piliaiev@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |danylo.piliaiev@gmail.com

--- Comment #2 from Danylo <danylo.piliaiev@gmail.com> ---
Created attachment 144152
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144152&action=3Dedit
Artifacts captured with OBS

No luck with it unfortunately. Also I got one small artifact when captured =
the
game with OBS but it happened only ones.

I'm somehow unable to launch CSGO with non system mesa:

LIBGL_DEBUG=3Dverbose LIBGL_DRIVERS_PATH=3Dpath_to_mesa_bin/lib/dri/
LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:path_to_mesa_bin/lib/ %command% &> ~/csg=
o.log

CSGO launches and screen remains black forever without any errors in log.
However other games work fine e.g. Rocket League. I don't know what I'm
missing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569182580.A78efc.20071
Date: Fri, 3 May 2019 21:17:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:danylo.pi=
liaiev&#64;gmail.com" title=3D"Danylo &lt;danylo.piliaiev&#64;gmail.com&gt;=
"> <span class=3D"fn">Danylo</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [R9 380X] Artifacts in CSGO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110575">bug 11057=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>danylo.piliaiev&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [R9 380X] Artifacts in CSGO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110575#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [R9 380X] Artifacts in CSGO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110575">bug 11057=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
danylo.piliaiev&#64;gmail.com" title=3D"Danylo &lt;danylo.piliaiev&#64;gmai=
l.com&gt;"> <span class=3D"fn">Danylo</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144152=
" name=3D"attach_144152" title=3D"Artifacts captured with OBS">attachment 1=
44152</a> <a href=3D"attachment.cgi?id=3D144152&amp;action=3Dedit" title=3D=
"Artifacts captured with OBS">[details]</a></span>
Artifacts captured with OBS

No luck with it unfortunately. Also I got one small artifact when captured =
the
game with OBS but it happened only ones.

I'm somehow unable to launch CSGO with non system mesa:

LIBGL_DEBUG=3Dverbose LIBGL_DRIVERS_PATH=3Dpath_to_mesa_bin/lib/dri/
LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:path_to_mesa_bin/lib/ %command% &amp;&gt=
; ~/csgo.log

CSGO launches and screen remains black forever without any errors in log.
However other games work fine e.g. Rocket League. I don't know what I'm
missing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569182580.A78efc.20071--

--===============1188708523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1188708523==--
