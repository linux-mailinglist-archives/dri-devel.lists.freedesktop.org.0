Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435FFA382F8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 13:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D950F89F01;
	Mon, 17 Feb 2025 12:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pNqPa/Yk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F4E89F01;
 Mon, 17 Feb 2025 12:27:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B036CA4107E;
 Mon, 17 Feb 2025 12:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408DEC4CED1;
 Mon, 17 Feb 2025 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739795251;
 bh=MIwYUtXnjoepjUfjvLW564dXH5Zc3Mu+jVREsCj6b3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pNqPa/Yk+KlWdNEOwwuagNYFcRU8YiLAo+jDc5w/rEo1470xncMv4DECtOyNVNPUL
 dkRRmnnAV2vfOgukrS55kqH34XHuw/kSc+NO02ST2KoWC95XCMstzP0Zc2GD8YTcsL
 7oYPf3AbkecKDt8uNnBP5bWibYc5wjsoJ3cR0M/tvGtKKFHkz7hvZW/yeikwd9Vl9r
 I8rkT+/q18cKYX/EZlQXqrCmHpHSeGqokZHlDkR/XI6/JHYXb4JxOuK+yKIcs/hjbt
 jm1aMnIbkeGXUSfbnZXCApDPk85lWCAJYWF0viD+8XDOU7l3ZlswK+fsmSWHz/c2z6
 9RW/7oBkQLcUw==
Date: Mon, 17 Feb 2025 13:27:25 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Remove myself
Message-ID: <Z7MrLUlSzS_I3YPK@cassiopeiae>
References: <20250215073753.1217002-1-kherbst@redhat.com>
 <20250215073753.1217002-2-kherbst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215073753.1217002-2-kherbst@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2025 at 08:37:53AM +0100, Karol Herbst wrote:
> I was pondering with myself for a while if I should just make it official
> that I'm not really involved in the kernel community anymore, neither as a
> reviewer, nor as a maintainer.
> 
> Most of the time I simply excused myself with "if something urgent comes
> up, I can chime in and help out". Lyude and Danilo are doing a wonderful
> job and I've put all my trust into them.
> 
> However, there is one thing I can't stand and it's hurting me the most.
> I'm convinced, no, my core believe is, that inclusivity and respect,
> working with others as equals, no power plays involved, is how we should
> work together within the Free and Open Source community.
> 
> I can understand maintainers needing to learn, being concerned on
> technical points. Everybody deserves the time to understand and learn. It
> is my true belief that most people are capable of change eventually. I
> truly believe this community can change from within, however this doesn't
> mean it's going to be a smooth process.
> 
> The moment I made up my mind about this was reading the following words
> written by a maintainer within the kernel community:
> 
> 	"we are the thin blue line"
> 
> This isn't okay. This isn't creating an inclusive environment. This isn't
> okay with the current political situation especially in the US. A
> maintainer speaking those words can't be kept. No matter how important
> or critical or relevant they are. They need to be removed until they
> learn. Learn what those words mean for a lot of marginalized people. Learn
> about what horrors it evokes in their minds.
> 
> I can't in good faith remain to be part of a project and its community
> where those words are tolerated. Those words are not technical, they are
> a political statement. Even if unintentionally, such words carry power,
> they carry meanings one needs to be aware of. They do cause an immense
> amount of harm.
> 
> I wish the best of luck for everybody to continue to try to work from
> within. You got my full support and I won't hold it against anybody trying
> to improve the community, it's a thankless job, it's a lot of work. People
> will continue to burn out.
> 
> I got burned out enough by myself caring about the bits I maintained, but
> eventually I had to realize my limits. The obligation I felt was eating me
> from inside. It stopped being fun at some point and I reached a point
> where I simply couldn't continue the work I was so motivated doing as I've
> did in the early days.
> 
> Please respect my wishes and put this statement as is into the tree.
> Leaving anything out destroys its entire meaning.
> 
> Respectfully
> 
> Karol
> 
> Signed-off-by: Karol Herbst <kherbst@redhat.com>

@Steven, @Masami: Can I get an ACK for taking this through the drm-misc tree?

(Not cutting any context, since you have not been copied on this one.)

- Danilo

> ---
>  MAINTAINERS | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25c86f47353de..ca31e57fa203c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7431,7 +7431,6 @@ F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
>  F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>  
>  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
> -M:	Karol Herbst <kherbst@redhat.com>
>  M:	Lyude Paul <lyude@redhat.com>
>  M:	Danilo Krummrich <dakr@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
> @@ -24062,7 +24061,6 @@ F:	tools/testing/selftests/ftrace/
>  TRACING MMIO ACCESSES (MMIOTRACE)
>  M:	Steven Rostedt <rostedt@goodmis.org>
>  M:	Masami Hiramatsu <mhiramat@kernel.org>
> -R:	Karol Herbst <karolherbst@gmail.com>
>  R:	Pekka Paalanen <ppaalanen@gmail.com>
>  L:	linux-kernel@vger.kernel.org
>  L:	nouveau@lists.freedesktop.org
> -- 
> 2.48.1
> 
