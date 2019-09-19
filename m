Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C3AB8259
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 22:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58F46FB46;
	Thu, 19 Sep 2019 20:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF0E36FB4C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 20:20:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BC81D72167; Thu, 19 Sep 2019 20:20:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Thu, 19 Sep 2019 20:20:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: bisected
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111077-502-Rz62goLd2x@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111077-502@http.bugs.freedesktop.org/>
References: <bug-111077-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0998336980=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0998336980==
Content-Type: multipart/alternative; boundary="15689244183.5Bf63e.1787"
Content-Transfer-Encoding: 7bit


--15689244183.5Bf63e.1787
Date: Thu, 19 Sep 2019 20:20:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

Matt Turner <mattst88@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|mattst88@gmail.com          |

--- Comment #44 from Matt Turner <mattst88@gmail.com> ---
(In reply to roland@rptd.ch from comment #43)
> Sorry, but this is rude. I waited for an answer on my result of testing t=
he
> patch (as requested) and that's what I get as answer? I can continue tryi=
ng
> to find a reproducible task but then please say that you acknowledged my
> finding so I can continue in a helpful way.

Huh? Thanks for testing, but I'm just informing you now that the
stab-in-the-dark attempted fix didn't solve it that you're probably not goi=
ng
to see this fixed unless you can find a way for developers to reproduce. I'm
not sure why you think that's rude.

And honestly I've spent soooo much time trying to help you and it's been
*painful* at every step. I've done this kind of triage for 10 years and I d=
on't
remember a more frustrating experience helping a user. I'm un'Cc'ing myself
since I don't work on this driver and I feel that my time is better spent
elsewhere.

Best of luck.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689244183.5Bf63e.1787
Date: Thu, 19 Sep 2019 20:20:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mattst88&=
#64;gmail.com" title=3D"Matt Turner &lt;mattst88&#64;gmail.com&gt;"> <span =
class=3D"fn">Matt Turner</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>mattst88&#64;gmail.com
           </td>
           <td>
               &nbsp;
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c44">Comme=
nt # 44</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mattst88&#64;gmail.com" title=3D"Matt Turner &lt;mattst88&#64;gmail.com&gt;=
"> <span class=3D"fn">Matt Turner</span></a>
</span></b>
        <pre>(In reply to <a href=3D"mailto:roland&#64;rptd.ch">roland&#64;=
rptd.ch</a> from <a href=3D"show_bug.cgi?id=3D111077#c43">comment #43</a>)
<span class=3D"quote">&gt; Sorry, but this is rude. I waited for an answer =
on my result of testing the
&gt; patch (as requested) and that's what I get as answer? I can continue t=
rying
&gt; to find a reproducible task but then please say that you acknowledged =
my
&gt; finding so I can continue in a helpful way.</span >

Huh? Thanks for testing, but I'm just informing you now that the
stab-in-the-dark attempted fix didn't solve it that you're probably not goi=
ng
to see this fixed unless you can find a way for developers to reproduce. I'm
not sure why you think that's rude.

And honestly I've spent soooo much time trying to help you and it's been
*painful* at every step. I've done this kind of triage for 10 years and I d=
on't
remember a more frustrating experience helping a user. I'm un'Cc'ing myself
since I don't work on this driver and I feel that my time is better spent
elsewhere.

Best of luck.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689244183.5Bf63e.1787--

--===============0998336980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0998336980==--
