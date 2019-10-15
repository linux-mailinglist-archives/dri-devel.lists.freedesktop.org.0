Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED5D6C6B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 02:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F9A6E5CC;
	Tue, 15 Oct 2019 00:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC0E46E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 00:24:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C7E537296E; Tue, 15 Oct 2019 00:24:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111986] 5700 XT hangs entire system in games
Date: Tue, 15 Oct 2019 00:24:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: danielsuarez369@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111986-502-8GG31jQ4ZL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111986-502@http.bugs.freedesktop.org/>
References: <bug-111986-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0810417384=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0810417384==
Content-Type: multipart/alternative; boundary="15710990520.9Ec99Ff86.5160"
Content-Transfer-Encoding: 7bit


--15710990520.9Ec99Ff86.5160
Date: Tue, 15 Oct 2019 00:24:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111986

--- Comment #12 from Daniel Suarez <danielsuarez369@protonmail.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #11)
> (In reply to Daniel Suarez from comment #10)
> > Created attachment 145736 [details]
> > Got by running sudo journalctl -b > dmesg.log
> >=20
> > Thanks to the explanation by someone I believe I understand now what you
> > meant. I went ahead and reproduced the hang by running gfxbench and whe=
n the
> > system hanged at around 3:23 I force shutdown seconds later, once I boo=
ted
> > in I ran "sudo journalctl -b > dmesg.log" and I am sending you the outp=
ut now
>=20
> You need to use "sudo journalctl -b -1 > dmesg.log" to get the logs from =
the
> previous boot (=3D the one that hanged).

I am deeply sorry, I attach the correct one now

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15710990520.9Ec99Ff86.5160
Date: Tue, 15 Oct 2019 00:24:12 +0000
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
   title=3D"NEW - 5700 XT hangs entire system in games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111986#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 5700 XT hangs entire system in games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111986">bug 11198=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
danielsuarez369&#64;protonmail.com" title=3D"Daniel Suarez &lt;danielsuarez=
369&#64;protonmail.com&gt;"> <span class=3D"fn">Daniel Suarez</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D111986#c11">comment #11</a>)
<span class=3D"quote">&gt; (In reply to Daniel Suarez from <a href=3D"show_=
bug.cgi?id=3D111986#c10">comment #10</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D145736" n=
ame=3D"attach_145736" title=3D"Got by running sudo journalctl -b &gt; dmesg=
.log">attachment 145736</a> <a href=3D"attachment.cgi?id=3D145736&amp;actio=
n=3Dedit" title=3D"Got by running sudo journalctl -b &gt; dmesg.log">[detai=
ls]</a></span>
&gt; &gt; Got by running sudo journalctl -b &gt; dmesg.log
&gt; &gt;=20
&gt; &gt; Thanks to the explanation by someone I believe I understand now w=
hat you
&gt; &gt; meant. I went ahead and reproduced the hang by running gfxbench a=
nd when the
&gt; &gt; system hanged at around 3:23 I force shutdown seconds later, once=
 I booted
&gt; &gt; in I ran &quot;sudo journalctl -b &gt; dmesg.log&quot; and I am s=
ending you the output now
&gt;=20
&gt; You need to use &quot;sudo journalctl -b -1 &gt; dmesg.log&quot; to ge=
t the logs from the
&gt; previous boot (=3D the one that hanged).</span >

I am deeply sorry, I attach the correct one now</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15710990520.9Ec99Ff86.5160--

--===============0810417384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0810417384==--
