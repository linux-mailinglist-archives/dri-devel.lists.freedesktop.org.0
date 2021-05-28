Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3013948AA
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 00:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A224B6E092;
	Fri, 28 May 2021 22:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40196E092;
 Fri, 28 May 2021 22:26:00 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id f22so3565678pgb.9;
 Fri, 28 May 2021 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kIerrdAACa5ElcTZMNjLYh5FnG/+0aexVOIC6S2e/iU=;
 b=lVru37wyBx5EM87cVpI7I/ueCROCWC9g9dsUvlfirlZcAysR1D2fn6HrI3Bg5tHOJB
 dDbowBxfpEdWdoCdoUNjlEq/5XIziX7WkELw8/rLo6WNtpWI5dgFwIV2GHgM9qMX44JK
 vtQ35hQZMhcHjuYpu5NhmXrjl9NTmbGZpizRhSq4F3EhR1MnVnVYL0+ffZyHyCvWTB9q
 8i4A8vqqmxUaxA+l7G/Q5CMJnvcW00drr9hMfHekCjVKPEJpBvrQ1wIeF4isXbq+9pSJ
 kGdYpodV/rEO1a87LcZ8obnhEBP3t7BFCMxO6McamsfcBbLLjC4kJIFlCU0ICtbSVdZa
 7MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kIerrdAACa5ElcTZMNjLYh5FnG/+0aexVOIC6S2e/iU=;
 b=oapNnzr4Kew901F4FAbsM2m9Tvld9pp8d0QVSCJKuVnSG+BISF48ls1Erb5Gu2dcjB
 kXEUO87HVJEvxp/+WDdWYmEYYGwjA7BKV8i6jQDQcebm9nPn6MvQM/MwW3A2gLZPB1xP
 OO5W4O5qgu66B/h7BCCBRq9u4Nh7gzvL/DawgJ5orNKJrFtkx880u/TaD4rXzbXzZBbj
 OnSDsCsh0Y/PpX72thKZKycy3jNnrMab2WkJ6cpgSdJOFb7m2n69EdB0aE8qMTD7skB6
 l0IPjN4WOsdPEQ2ljfCirKAXc4twCoLyi92cSijphwLgxcm8th/74rzbwNHTg/bA56Uw
 q7Cg==
X-Gm-Message-State: AOAM533j2BS+2sE2envJcsF5Mowz3tqRplS2GDeEcwfp3V50FmHoVHs6
 IadmKYigyWrb/Ga+ECjdXCjyhe7+3dinA7/eYwo=
X-Google-Smtp-Source: ABdhPJxxkBGavOr/1H2y1joQ0W5E9GTv1uX7W9EwAT/+UNUqrkuss8VX17npUKlLxloHRcbscR3EmMT7gVE6yQjCBm8=
X-Received: by 2002:a05:6a00:22c1:b029:2dc:edbe:5e9 with SMTP id
 f1-20020a056a0022c1b02902dcedbe05e9mr6070305pfj.51.1622240760422; Fri, 28 May
 2021 15:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <c0c61805-7e13-05a0-ed7f-9cd61ca2b209@gmail.com>
In-Reply-To: <c0c61805-7e13-05a0-ed7f-9cd61ca2b209@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 28 May 2021 18:25:24 -0400
Message-ID: <CAAxE2A7wGCfDV=iYoXpP4JzObn9okGk4_WLH+sV-oJJjSk0DxQ@mail.gmail.com>
Subject: Re: Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000043e67e05c36b5c92"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000043e67e05c36b5c92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If both implicit and explicit synchronization are handled the same, then
the kernel won't be able to identify the process that caused an implicit
sync deadlock. The process that is stuck waiting for a fence can be
innocent, and the kernel can't punish it. Likewise, the GPU reset guery
that reports which process is guilty and innocent will only be able to
report unknown. Is that OK?

Marek

On Fri, May 28, 2021 at 10:41 AM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Hi Marek,
>
> well I don't think that implicit and explicit synchronization needs to be
> mutual exclusive.
>
> What we should do is to have the ability to transport an synchronization
> object with each BO.
>
> Implicit and explicit synchronization then basically become the same, the=
y
> just transport the synchronization object differently.
>
> The biggest problem are the sync_files for Android, since they are really
> not easy to support at all. If Android wants to support user queues we
> would probably have to do some changes there.
>
> Regards,
> Christian.
>
> Am 27.05.21 um 23:51 schrieb Marek Ol=C5=A1=C3=A1k:
>
> Hi,
>
> Since Christian believes that we can't deadlock the kernel with some
> changes there, we just need to make everything nice for userspace too.
> Instead of explaining how it will work, I will explain the cases where
> future hardware (and its kernel driver) will break existing userspace in
> order to protect everybody from deadlocks. Anything that uses implicit sy=
nc
> will be spared, so X and Wayland will be fine, assuming they don't
> import/export fences. Those use cases that do import/export fences might =
or
> might not work, depending on how the fences are used.
>
> One of the necessities is that all fences will become future fences. The
> semantics of imported/exported fences will change completely and will hav=
e
> new restrictions on the usage. The restrictions are:
>
>
> 1) Android sync files will be impossible to support, so won't be
> supported. (they don't allow future fences)
>
>
> 2) Implicit sync and explicit sync will be mutually exclusive between
> process. A process can either use one or the other, but not both. This is
> meant to prevent a deadlock condition with future fences where any proces=
s
> can malevolently deadlock execution of any other process, even execution =
of
> a higher-privileged process. The kernel will impose the following
> restrictions to protect against the deadlock:
>
> a) a process with an implicitly-sync'd imported/exported buffer can't
> import/export a fence from/to another process
> b) a process with an imported/exported fence can't import/export an
> implicitly-sync'd buffer from/to another process
>
> Alternative: A higher-privileged process could enforce both restrictions
> instead of the kernel to protect itself from the deadlock, but this would
> be a can of worms for existing userspace. It would be better if the kerne=
l
> just broke unsafe userspace on future hw, just like sync files.
>
> If both implicit and explicit sync are allowed to occur simultaneously,
> sending a future fence that will never signal to any process will deadloc=
k
> that process after it acquires the implicit sync lock, which is a sequenc=
e
> number that the process is required to write to memory and send an
> interrupt from the GPU in a finite time. This is how the deadlock can
> happen:
>
> * The process gets sequence number N from the kernel for an
> implicitly-sync'd buffer.
> * The process inserts (into the GPU user-mapped queue) a wait for sequenc=
e
> number N-1.
> * The process inserts a wait for a fence, but it doesn't know that it wil=
l
> never signal =3D=3D> deadlock.
> ...
> * The process inserts a command to write sequence number N to a
> predetermined memory location. (which will make the buffer idle and send =
an
> interrupt to the kernel)
> ...
> * The kernel will terminate the process because it has never received the
> interrupt. (i.e. a less-privileged process just killed a more-privileged
> process)
>
> It's the interrupt for implicit sync that never arrived that caused the
> termination, and the only way another process can cause it is by sending =
a
> fence that will never signal. Thus, importing/exporting fences from/to
> other processes can't be allowed simultaneously with implicit sync.
>
>
> 3) Compositors (and other privileged processes, and display flipping)
> can't trust imported/exported fences. They need a timeout recovery
> mechanism from the beginning, and the following are some possible solutio=
ns
> to timeouts:
>
> a) use a CPU wait with a small absolute timeout, and display the previous
> content on timeout
> b) use a GPU wait with a small absolute timeout, and conditional renderin=
g
> will choose between the latest content (if signalled) and previous conten=
t
> (if timed out)
>
> The result would be that the desktop can run close to 60 fps even if an
> app runs at 1 fps.
>
> *Redefining imported/exported fences and breaking some users/OSs is the
> only way to have userspace GPU command submission, and the deadlock examp=
le
> here is the counterexample proving that there is no other way.*
>
> So, what are the chances this is going to fly with the ecosystem?
>
> Thanks,
> Marek
>
>
>

--00000000000043e67e05c36b5c92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If both implicit and explicit synchronization are han=
dled the same, then the kernel won&#39;t be able to identify the process th=
at caused an implicit sync deadlock. The process that is stuck waiting for =
a fence can be innocent, and the kernel can&#39;t punish it. Likewise, the =
GPU reset guery that reports which process is guilty and innocent will only=
 be able to report unknown. Is that OK?<br></div><div></div><br><div>Marek<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, May 28, 2021 at 10:41 AM Christian K=C3=B6nig &lt;<a href=
=3D"mailto:ckoenig.leichtzumerken@gmail.com">ckoenig.leichtzumerken@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
 =20
   =20
 =20
  <div>
    Hi Marek,<br>
    <br>
    well I don&#39;t think that implicit and explicit synchronization needs
    to be mutual exclusive.<br>
    <br>
    What we should do is to have the ability to transport an
    synchronization object with each BO.<br>
    <br>
    Implicit and explicit synchronization then basically become the
    same, they just transport the synchronization object differently.<br>
    <br>
    The biggest problem are the sync_files for Android, since they are
    really not easy to support at all. If Android wants to support user
    queues we would probably have to do some changes there.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div>Am 27.05.21 um 23:51 schrieb Marek
      Ol=C5=A1=C3=A1k:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Hi,</div>
        <div><br>
        </div>
        <div>Since Christian believes that we can&#39;t deadlock the kernel
          with some changes there, we just need to make everything nice
          for userspace too. Instead of explaining how it will work, I
          will explain the cases where future hardware (and its kernel
          driver) will break existing userspace in order to protect
          everybody from deadlocks. Anything that uses implicit sync
          will be spared, so X and Wayland will be fine, assuming they
          don&#39;t import/export fences. Those use cases that do
          import/export fences might or might not work, depending on how
          the fences are used.<br>
        </div>
        <div><br>
        </div>
        <div>One of the necessities is that all fences will become
          future fences. The semantics of imported/exported fences will
          change completely and will have new restrictions on the usage.
          The restrictions are:<br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>1) Android sync files will be impossible to support, so
          won&#39;t be supported. (they don&#39;t allow future fences)<br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>2) Implicit sync and explicit sync will be mutually
          exclusive between process. A process can either use one or the
          other, but not both. This is meant to prevent a deadlock
          condition with future fences where any process can
          malevolently deadlock execution of any other process, even
          execution of a higher-privileged process. The kernel will
          impose the following restrictions to protect against the
          deadlock:<br>
        </div>
        <div><br>
        </div>
        <div>a) a process with an implicitly-sync&#39;d imported/exported
          buffer can&#39;t import/export a fence from/to another process<br=
>
        </div>
        <div>b) a process with an imported/exported fence can&#39;t
          import/export an implicitly-sync&#39;d buffer from/to another
          process</div>
        <div><br>
        </div>
        <div>Alternative: A higher-privileged process could enforce both
          restrictions instead of the kernel to protect itself from the
          deadlock, but this would be a can of worms for existing
          userspace. It would be better if the kernel just broke unsafe
          userspace on future hw, just like sync files.<br>
        </div>
        <div><br>
        </div>
        <div>If both implicit and explicit sync are allowed to occur
          simultaneously, sending a future fence that will never signal
          to any process will deadlock that process after it acquires
          the implicit sync lock, which is a sequence number that the
          process is required to write to memory and send an interrupt
          from the GPU in a finite time. This is how the deadlock can
          happen:<br>
        </div>
        <div><br>
        </div>
        <div>* The process gets sequence number N from the kernel for an
          implicitly-sync&#39;d buffer.<br>
          <div>* The process inserts (into the GPU user-mapped queue) a
            wait for sequence number N-1.</div>
          * The process inserts a wait for a fence, but it doesn&#39;t know
          that it will never signal =3D=3D&gt; deadlock.<br>
        </div>
        <div>...<br>
        </div>
        <div>* The process inserts a command to write sequence number N
          to a predetermined memory location. (which will make the
          buffer idle and send an interrupt to the kernel)</div>
        <div>
          <div>...<br>
          </div>
          * The kernel will terminate the process because it has never
          received the interrupt. (i.e. a less-privileged process just
          killed a more-privileged process)<br>
        </div>
        <div><br>
        </div>
        <div>It&#39;s the interrupt for implicit sync that never arrived
          that caused the termination, and the only way another process
          can cause it is by sending a fence that will never signal.
          Thus, importing/exporting fences from/to other processes can&#39;=
t
          be allowed simultaneously with implicit sync.<br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div>3) Compositors (and other privileged processes, and display
          flipping) can&#39;t trust imported/exported fences. They need a
          timeout recovery mechanism from the beginning, and the
          following are some possible solutions to timeouts:</div>
        <div><br>
        </div>
        <div>a) use a CPU wait with a small absolute timeout, and
          display the previous content on timeout<br>
        </div>
        <div>b) use a GPU wait with a small absolute timeout, and
          conditional rendering will choose between the latest content
          (if signalled) and previous content (if timed out)</div>
        <div><br>
        </div>
        <div>The result would be that the desktop can run close to 60
          fps even if an app runs at 1 fps.</div>
        <div><br>
        </div>
        <div><b>Redefining imported/exported fences and breaking some
            users/OSs is the only way to have userspace GPU command
            submission, and the deadlock example here is the
            counterexample proving that there is no other way.</b></div>
        <div><br>
        </div>
        <div>So, what are the chances this is going to fly with the
          ecosystem?<br>
        </div>
        <div><br>
        </div>
        <div>Thanks,<br>
        </div>
        <div>Marek<br>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--00000000000043e67e05c36b5c92--
